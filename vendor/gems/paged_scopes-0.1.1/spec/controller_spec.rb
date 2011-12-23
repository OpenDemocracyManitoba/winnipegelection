require File.dirname(__FILE__) + '/spec_helper'

describe "Controller" do
  
  context "class" do
    it "should raise 404 on PagedScopes::PageNotFound" do
      Class.new(ActionController::Base).rescue_responses['PagedScopes::PageNotFound'].should == :not_found
    end
    
    it "should get the default collection name from the controller name" do
      [ "ArticlesController", "ArticleController", "Admin::ArticlesController" ].each do |controller_name|
        @class = Class.new(ActionController::Base)
        @class.stub!(:name).and_return(controller_name)
        @class.send(:default_collection_name).should == "articles"
      end
    end
    
    it "should not get the default collection name from a misnamed controller" do
      [ "", "SomeClassName" ].each do |controller_name|
        @class = Class.new(ActionController::Base)
        @class.stub!(:name).and_return(controller_name)
        lambda { @class.send(:default_collection_name) }.should raise_error(RuntimeError)
      end
    end
  end
    
  context "instance using #page_for" do
    before(:each) do
      @class = Class.new(ActionController::Base)
      @controller = @class.new
      @articles = User.first.articles
      @articles.per_page = 3
    end

    it "should default to the first page of the collection" do
      in_controller @controller do
        page_for(@articles).should == @articles.pages.first
      end
    end
    
    it "should find the page from a page id in the params" do
      in_controller @controller do
        @articles.pages.each do |page|
          stub!(:params).and_return(:page_id => page.id)
          page_for(@articles).should == page
        end
      end
    end
    
    it "should find the page containing an object if specified" do
      in_controller @controller do
        @articles.each do |article|
          page_for(@articles, article).should == @articles.pages.find_by_article(article)
          # page_for(@articles, article).articles.all.should include(article)
        end
      end
    end
    
    it "should set per_page on the collection if specified" do
      in_controller @controller do
        page_for(@articles, :per_page => 4)
        @articles.per_page.should == 4
      end
    end
    
    it "should set the page model name on the collection if specified" do
      in_controller @controller do
        page_for(@articles, :name => "Group")
        @articles.page_name.should == "Group"
      end
    end
    
    it "should set the pagination path proc if specified using a :path option" do
      in_controller @controller do
        @page = page_for(@articles, :path => :page_articles_path)
        self.should_receive(:page_articles_path).with(@page.next)
        @page.paginator.next
      end
    end
    
    it "should set the pagination path proc if specified with a block" do
      in_controller @controller do
        @page = page_for(@articles) { |page| "path/to/page/#{page.to_param}" }
        @page.paginator.next.should == "path/to/page/#{@page.next.to_param}"
      end
    end
  end
  
  context "class using #paginate" do
    before(:each) do
      @class = Class.new(ActionController::Base)
    end
    
    it "should add a protected paginate callback as a before filter when paginate is called" do
      @class.paginate :articles
      @class.before_filters.map(&:to_s).should include("paginate_articles")
      @class.protected_instance_methods.map(&:to_s).should include("paginate_articles")
    end
    
    it "should use the default collection name if no collection name is specified" do
      @class.stub!(:name).and_return("ArticlesController")
      @class.paginate
      @class.before_filters.map(&:to_s).should include("paginate_articles")
    end
    
    it "should pass filter options except for :per_page, :name and :path on to the before filter" do
      @options = { :per_page => 3, :name => "Group", :path => :page_articles_path, :only => [ :index, :show ], :if => :test }
      @class.paginate :articles, @options
      @filter = @class.filter_chain.detect { |filter| filter.method.to_s == "paginate_articles" }
      @filter.options.keys.should_not include(:per_page, :name, :path)
      @filter.options.keys.should include(:only, :if)
    end
  end
  
  context "instance using paginate with options in the controller class" do
    before(:each) do
      @options = { :per_page => 3, :name => "Group", :path => :page_articles_path, :only => [ :index, :show ], :if => :test }
      @class = Class.new(ActionController::Base)
      @class.paginate :articles, @options
      @controller = @class.new
    end
    
    it "should set :per_page on the collection" do
      in_controller @controller do
        @articles = User.first.articles
        paginate_articles
        @articles.per_page.should == @options[:per_page]
      end
    end

    it "should set :page_name on the collection" do
      in_controller @controller do
        @articles = User.first.articles
        paginate_articles
        @articles.page_name.should == @options[:name]
      end
    end

    it "should set a page instance variable named accordingly" do
      in_controller @controller do
        @articles = User.first.articles
        paginate_articles
        @group.should_not be_nil
      end
    end

    it "should set :path on the page's paginator" do
      in_controller @controller do
        @articles = User.first.articles
        paginate_articles
        self.should_receive(@options[:path])
        @group.paginator.first
      end
    end
  end
  
  context "instance using #paginate in the controller class" do
    before(:each) do
      @class = Class.new(ActionController::Base)
      @class.paginate :articles, :per_page => 3
      @controller = @class.new
    end
    
    it "should raise an error if no collection is set" do
      in_controller @controller do
        lambda { paginate_articles }.should raise_error(RuntimeError)
      end      
    end
    
    it "should pass :per_page, :name and :path options on to the call to #page_for" do
      @options = { :per_page => 3, :name => "Group", :path => :page_articles_path }
      @class.paginate :articles, @options
      @controller = @class.new
      in_controller @controller do
        @articles = User.first.articles
        self.should_receive(:page_for).with(@articles, nil, @options)
        paginate_articles
      end
    end

    context "when the collection is set before the filter is run" do
      before(:each) do
        in_controller @controller do
          @articles = User.first.articles
        end
      end
    
      it "should get the page from the collection object if set as an instance variable" do
        in_controller @controller do
          @articles.each do |article|
            @article = article
            paginate_articles
            @page.articles.all.should include(@article)
          end
        end
      end
      
      it "should get the page from the params if a collection object is not set or is a new record" do
        in_controller @controller do
          @articles.per_page = 3
          stub!(:params).and_return(:page_id => @articles.pages.last.id)
          [ nil, Article.new ].each do |article|
            @article = article
            paginate_articles
            @page.should == @articles.pages.last
          end
        end
      end

      it "should raise PageNotFound if the page id in the params is not in range" do
        in_controller @controller do
          @articles.per_page = 3
          stub!(:params).and_return(:page_id => @articles.pages.last.id + 1)
          lambda { paginate_articles }.should raise_error(PagedScopes::PageNotFound)
        end
      end
                
      it "should get the first page if the current object is a new record" do
        in_controller @controller do
          @article = @articles.new
          paginate_articles
          @page.should == @articles.pages.first
        end
      end
          
      it "should otherwise default to the first page" do
        in_controller @controller do
          paginate_articles
          @page.should == @articles.pages.first
        end
      end
    end
  end
end
