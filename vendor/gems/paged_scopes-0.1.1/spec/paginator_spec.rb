require File.dirname(__FILE__) + '/spec_helper'

describe "Paginator" do
  before(:each) do
    @articles = Article.scoped({})
    @articles.per_page = 2
    @pages = @articles.pages
    @path = lambda { |page| "/path/to/page/#{page.to_param}" }
  end
  
  it "should raise an error if the paginator path is not set" do
    lambda { @pages.first.paginator.next }.should raise_error(RuntimeError)
  end
    
  it "should call the path proc with the last page when #last is called" do
    @pages.each do |page|
      path = lambda { |page| }
      page.paginator.set_path(&path)
      path.should_receive(:call).with(@pages.last).and_return("/path")
      page.paginator.last.should == "/path"
    end
  end
  
  it "should call the path proc with the first page when #first is called" do
    @pages.each do |page|
      path = lambda { |page| }
      page.paginator.set_path(&path)
      path.should_receive(:call).with(@pages.first).and_return "/path"
      page.paginator.first.should == "/path"
    end
  end
  
  context "for the first page" do
    before(:each) do
      @page = @pages.first
      @paginator = @page.paginator
      @paginator.set_path(&@path)
    end

    it "should call the path proc with the next page when #next is called" do
      @path.should_receive(:call).with(@page.next).and_return("/path")
      @paginator.next.should == "/path"
    end
    
    it "should not call the path proc when #previous is called" do
      @path.should_not_receive(:call)
      @paginator.previous.should be_nil
    end
  end

  context "for the last page" do
    before(:each) do
      @page = @pages.last
      @paginator = @page.paginator
      @paginator.set_path(&@path)
    end

    it "should call the path proc with the previous page when #previous is called" do
      @path.should_receive(:call).with(@page.previous).and_return("/path")
      @paginator.previous.should == "/path"
    end
    
    it "should not call the path proc when #next is called" do
      @path.should_not_receive(:call)
      @paginator.next.should be_nil
    end
  end

  context "for any other page" do
    before(:each) do
      @page = @pages.all.second
      @paginator = @page.paginator
      @paginator.set_path(&@path)
    end

    it "should call the path proc with the next page when #next is called" do
      @path.should_receive(:call).with(@page.next).and_return("/path")
      @paginator.next.should == "/path"
    end
    
    it "should call the path proc with the previous page when #previous is called" do
      @path.should_receive(:call).with(@page.previous).and_return("/path")
      @paginator.previous.should == "/path"
    end
  end
  
  describe "window generator" do
    before(:each) do
      @pages.stub!(:count).and_return(14)
      @count = @pages.count
    end
    
    it "should raise an error if no block is provided" do
      lambda { @pages.first.paginator.window(:inner => 2) }.should raise_error(ArgumentError)
    end

    it "should raise an error if no inner size is provided" do
      lambda { @pages.first.paginator.window({}) { |page, path| } }.should raise_error(ArgumentError)
    end
    
    it "should concatenate all the block return values into a string" do
      page = @pages.find(6)
      page.paginator.set_path { |page| }
      links = (4..8).map { |n| "<li><a href='/path/to/page/#{6+n}'>#{6+n}</a></li>" }
      links.join("\n").should == page.paginator.window(:inner => 2) { |page, path| links.shift }
    end

    it "should call the block with the page and the path for each page in a window surrounding the page" do
      [
        [ 6,        4..8             ],
        [ 3,        1..5             ],
        [ 1,        1..5             ],
        [ @count-2, @count-4..@count ],
        [ @count,   @count-4..@count ]
      ].each do |number, range|
        page = @pages.find(number)
        page.paginator.set_path(&@path)
        pages, paths = [], []
        range.each do |n|
          pages << @pages.find(n)
          paths << (n == page.number ? nil : @path.call(@pages.find(n)))
        end
        page.paginator.window(:inner => 2) do |pg, path, classes|
          pg.should == pages.shift
          path.should == paths.shift
          pg == page ? classes.should(include(:selected)) : classes.should_not(include(:selected))
        end
      end
    end
    
    context "with an outer window" do
      it "should also call the block for each page in a window from the first and last pages, and include separators between the windws if necessary" do
        [
          [ 6,        1..2, 6-2..6+2,   @count-1..@count ],
          [ 5,                1..5+2,   @count-1..@count ],
          [ 3,                  1..5,   @count-1..@count ],
          [ 1,                  1..5,   @count-1..@count ],
          [ @count-4, 1..2,           @count-4-2..@count ],
          [ @count-2, 1..2,             @count-4..@count ],
          [ @count,   1..2,             @count-4..@count ]
        ].each do |number, *ranges|
          page = @pages.find(number)
          page.paginator.set_path(&@path)
          pages, paths, gaps_before, gaps_after = [], [], [], []
          ranges.each do |range|
            range.each do |n|
              pages << @pages.find(n)
              paths << (n == page.number ? nil : @path.call(@pages.find(n)))
            end
          end
          pages.each_with_index { |pg, n| gaps_before << (pages[n-1] ? pages[n-1].number < pg.number - 1 : false) }
          pages.each_with_index { |pg, n| gaps_after << (pages[n+1] ? pages[n+1].number > pg.number + 1 : false) }
          page.paginator.window(:inner => 2, :outer => 2) do |pg, path, classes|
            pg.should == pages.shift
            path.should == paths.shift
            gaps_before.shift ? classes.should(include(:gap_before)) : classes.should_not(include(:gap_before))
            gaps_after.shift ? classes.should(include(:gap_after)) : classes.should_not(include(:gap_after))
          end
        end
      end
    end
    
    [ [ :previous, 2, 1 ], [ :next, 1, 2 ] ].each do |extra, number, new_number|
      it "should call the block with #{extra.inspect} and the path for the #{extra} page if #{extra.inspect} is specified as an extra" do
        page = @pages.find(number)
        page.paginator.set_path(&@path)
        pages_paths = []
        page.paginator.window(:inner => 2, :extras => [ extra ]) do |page, path, classes|
          pages_paths << [ page, path ]
        end
        pages_paths.should include([ extra, @path.call(@pages.find(new_number)) ])
      end
    end

    [ [ :previous, "1" ], [ :next, "@count" ] ].each do |extra, number|
      it "should call the block with #{extra.inspect} and a nil path if #{extra.inspect} is specified as an extra but there is no #{extra} page" do
        page = @pages.find(eval(number))
        page.paginator.set_path(&@path)
        pages_paths = []
        page.paginator.window(:inner => 2, :extras => [ extra ]) do |page, path, classes|
          pages_paths << [ page, path ]
        end
        pages_paths.should include([ extra, nil ])
      end
    end
    
    [ :first, :last ].each do |extra|
      it "should call the block with #{extra.inspect} and the path for the #{extra} page if #{extra.inspect} is specified as an extra" do
        page = @pages.find(6)
        page.paginator.set_path(&@path)
        pages_paths = []
        page.paginator.window(:inner => 2, :extras => [ extra ]) do |page, path, classes|
          pages_paths << [ page, path ]
        end
        pages_paths.should include([ extra, @path.call(@pages.send(extra)) ])
      end
    end

    [ [ :first, "1" ], [ :last, "@count" ] ].each do |extra, number|
      it "should call the block with #{extra.inspect} and a nil path if #{extra.inspect} is specified as an extra but the current page is the #{extra} page" do
        page = @pages.find(eval(number))
        page.paginator.set_path(&@path)
        pages_paths = []
        page.paginator.window(:inner => 2, :extras => [ extra ]) do |page, path, classes|
          pages_paths << [ page, path ]
        end
        pages_paths.should include([ extra, nil ])
      end
    end
    
    it "should call the block with :first, :previous, pages, :next, :last in that order" do
      page = @pages.find(6)
      page.paginator.set_path(&@path)
      pages = []
      page.paginator.window(:inner => 1, :extras => [ :first, :previous, :next, :last ]) do |page, path, classes|
        pages << page
      end
      pages.should == [ :first, :previous, @pages.find(5), @pages.find(6), @pages.find(7), :next, :last ]
    end
  end

  describe "window generator for a collection with fewer pages than the window size" do
    it "should list all the page" do
      @pages.stub!(:count).and_return(5)
      @pages.each do |page|
        page.paginator.set_path(&@path)
        pages = @pages.all
        page.paginator.window(:inner => 2) do |pg, path, classes|
          pg.should == pages.shift
          if pg == page
            path.should be_nil
            classes.should include(:selected)
          else
            path.should_not be_nil
            classes.should_not include(:selected)
          end
          classes.should_not include(:gap_before, :gap_after)
        end
        pages.should be_empty
      end
    end
  end
  
  describe "window generator for a collection with only one page" do
    it "should not generate any links" do
      @pages.stub!(:count).and_return(1)
      page = @pages.first
      page.paginator.set_path(&@path)
      @path.should_not_receive(:call)
      page.paginator.window(:inner => 2) do |pg, path, classes|
        fail "expected block not to be called"
        "<a>some link</a>"
      end.should be_blank
    end
  end
end
