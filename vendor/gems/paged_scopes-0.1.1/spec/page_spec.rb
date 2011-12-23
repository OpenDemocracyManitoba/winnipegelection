require File.dirname(__FILE__) + '/spec_helper'

describe "Pages" do
  in_contexts do
    before(:each) do
      @pages = @articles.pages
      @per_page = 2
      @articles.stub!(:per_page).and_return(@per_page)
      @articles.stub!(:page_name).and_return("Page")
    end
    
    it "should raise an error if per_page is not specified" do
      @articles.stub!(:per_page).and_return(nil)
      lambda { @pages.per_page }.should raise_error(RuntimeError)
    end
    
    it "should paginate using per_page from its proxy if available" do
      @articles.stub!(:per_page).and_return(@per_page)
      @pages.per_page.should == @per_page
    end
      
    it "should be a class" do
      @pages.should be_a_kind_of(Class)
    end
    
    it "should be a class with name of the proxy's page name" do
      @pages.name.should == "Page"
    end
        
    it "should know the page count" do
      @pages.count.should == (@articles.all.length - 1)/@per_page + 1
    end
    
    it "should cache the page count" do
      @articles.should_receive(:count).and_return(1)
      2.times { @pages.count }
    end

    it "should clear the count cache when reloaded" do
      @articles.should_receive(:count).twice.and_return(1)
      @pages.count
      @pages.reload!
      @pages.count
    end
    
    it "should find pages with valid numbers" do
      1.upto(@pages.count) do |number|
        lambda { @pages.find(number) }.should_not raise_error
      end
    end
    
    it "should cache the results of find" do
      @pages.should_receive(:new).once
      2.times { @pages.find(1) }
    end
    
    it "should clear the find cache when reloaded" do
      @pages.should_receive(:new).twice
      @pages.find(1)
      @pages.reload!
      @pages.find(1)
    end
        
    it "should raise an error containing the nearest substitute page for invalid page numbers" do
      [ [ -1, @pages.first], [ 0, @pages.first ], [ @pages.count + 1, @pages.last ] ].each do |number, substitute_page|
        lambda { @pages.find(number) }.should raise_error do |error|
          error.substitute.should == substitute_page
        end
      end  
    end
    
    it "should be enumerable" do
      @pages.metaclass.included_modules.should include(Enumerable)
      @pages.should respond_to(:each)
      args_for_each = []
      @pages.each { |page| args_for_each << page }
      args_for_each.should == (1..@pages.count).map { |number| @pages.find(number) }
    end
    
    it "should find the first page" do
      @pages.first.number.should == 1
    end
    
    it "should find the last page" do
      @pages.last.number.should == @pages.count
    end
    
    it "should find all pages" do
      @pages.all.should == (1..@pages.count).map { |number| @pages.find(number) }
    end
    
    it "should find a page closest to a given number" do
      @pages.closest_to(0               ).should == @pages.first
      @pages.closest_to(@pages.count    ).should == @pages.last
      @pages.closest_to(@pages.count + 1).should == @pages.last
    end
    
    it "should find the page of an object in the collection" do
      @articles.all.each_with_index do |article, index|
        @pages.find_by_article(article).number.should == 1 + index/@pages.per_page
      end
    end
    
    it "should not find the page of an object not in the collection" do
      (Article.all - @articles.all).each do |article|
        @pages.find_by_article(article).should be_nil
        lambda { @pages.find_by_article!(article) }.should raise_error(PagedScopes::PageNotFound)
      end
    end
    
    it "should not find the page of an object if the object is a new record" do
      lambda { @pages.find_by_article!(Article.new) }.should raise_error(PagedScopes::PageNotFound)
    end
    
    it "should not find the page of an object if the object is not an ActiveRecord::Base instance" do
      lambda { @pages.find_by_article!(Object.new) }.should raise_error(PagedScopes::PageNotFound)
    end
        
    it "should find a page from a params hash with a pages name as an id in the key" do
      @pages.stub!(:name).and_return("Page")
      @pages.from_params!(:page_id => "1").should == @pages.first
    end

    it "should find a nil page from a params hash without a pages name as an id in the key" do
      @pages.stub!(:name).and_return("Page")
      @pages.from_params!({}).should be_nil
    end

    it "should raise an error from a params hash containing an out-of-range page id in the key" do
      @pages.stub!(:name).and_return("Page")
      lambda { @pages.from_params!(:page_id => @pages.count + 1) }.should raise_error(PagedScopes::PageNotFound)
    end
  end
  
  context "for an empty collection" do
    before(:each) do
      @articles = Article.scoped(:conditions => { :title => "Supercalifragilisticexpialidocious" })
      @articles.all.should be_empty
      @articles.per_page = 2
    end
    
    it "should have one page" do
      @articles.pages.count.should == 1
    end
    
    it "should have a page numbered one" do
      @articles.pages.first.number.should == 1
    end
    
    it "should have an empty page" do
      @articles.pages.first.articles.all.should be_empty
    end
  end
end

describe "Page instance" do
  in_contexts do
    before(:each) do
      @pages = @articles.pages
      @per_page = 2
      @articles.stub!(:per_page).and_return(@per_page)
    end
    
    it "should have a scope representing the objects in the page" do
      @pages.each { |page| page.articles.class.should == ActiveRecord::NamedScope::Scope }
    end
    
    it "should know its number" do
      @pages.find(1).number.should == 1
    end
    
    it "should parameterise to the page number" do
      @pages.map(&:to_param).should == @pages.map(&:number).map(&:to_s)
    end
    
    it "should have the page number as id" do
      @pages.map(&:id).should == @pages.map(&:number)
    end
    
    it "should clear the page class cache when reloaded" do
      @pages.should_receive(:reload!)
      @pages.first.reload!
    end
    
    it "should be found again by the page class when reloaded" do
      @page = @pages.first
      @pages.should_receive(:find).with(@page.number)
      @page.reload!
    end
    
    it "should know whether it's first" do
      pages = @pages.all
      pages.shift.should be_first
      pages.each { |page| page.should_not be_first }
    end
    
    it "should know whether it's last" do
      pages = @pages.all
      pages.pop.should be_last
      pages.each { |page| page.should_not be_last }
    end
    
    it "should know the next page" do
      pages = @pages.all
      until pages.empty? do
        pages.shift.next.should == pages.first
      end
    end
    
    it "should know the previous page" do
      pages = @pages.all
      until pages.empty? do
        pages.pop.previous.should == pages.last
      end
    end
    
    it "should know the page which is offset by a specified amount" do
      [ -2, 0, +2 ].each do |offset|
        pages = @pages.all
        pages.each_with_index do |page, index|
          page.offset(offset).should == (index + offset < 0 ? nil : pages[index + offset])
        end
      end
    end
    
    it "should be equal based on its page number" do
      @pages.find(1).should == @pages.find(1)
      @pages.find(1).should_not == @pages.find(2)
    end
    
    it "should know the page count" do
      @pages.first.page_count.should == @pages.count
    end
    
    it "should be sortable by page number" do
      @pages.all.reverse.sort.should == @pages.all
    end
                
    it "should know whether it's full" do
      @pages.each do |page|
        page.articles.all.length == @per_page ? page.should(be_full) : page.should_not(be_full)
      end
    end
    
    it "should be correctly paginated and ordered" do
      @pages.map(&:articles).should == @articles.all.in_groups_of(@per_page, false)
    end
  end
end
