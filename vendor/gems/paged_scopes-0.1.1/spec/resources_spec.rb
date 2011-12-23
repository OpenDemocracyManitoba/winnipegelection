require File.dirname(__FILE__) + '/spec_helper'

describe "Resources" do
  before(:each) do
    ActionController::Routing::Routes.clear!
  end
  
  after(:each) do
    ActionController::Routing::Routes.clear!
  end

  it "should not affect normal resource mapping if :paged option is not specified" do
    drawing_routes { |map| map.resources :articles }.should change { number_of_routes }.by(7)
  end
  
  it "should add a paged index route if a :paged option is specified" do
    drawing_routes { |map| map.resources :articles, :paged => true }.should change { number_of_routes }.by(7+1)
  end
  
  it "should not add a paged index route if the index action is excluded by an :only option" do
    drawing_routes { |map| map.resources :articles, :paged => true, :only => :show }.should change { number_of_routes }.by(1+0)
    drawing_routes { |map| map.resources :memberships, :paged => true, :only => [ :show, :edit ] }.should change { number_of_routes }.by(2+0)
  end
  
  it "should not add a paged index route if the index action is excluded by an :except option" do
    drawing_routes { |map| map.resources :articles, :paged => true, :except => :index }.should change { number_of_routes }.by(6+0)
    drawing_routes { |map| map.resources :memberships, :paged => true, :except => [ :index, :new ] }.should change { number_of_routes }.by(5+0)
  end
  
  context "with a :paged options" do    
    it "should map a paged index route for GET only" do
      draw_routes { |map| map.resources :articles, :paged => true }
      recognise_path(   :get, "/pages/1/articles").should == { :controller => "articles", :action => "index", :page_id => "1" }
      recognise_path(   :put, "/pages/1/articles").should be_nil
      recognise_path(  :post, "/pages/1/articles").should be_nil
      recognise_path(:delete, "/pages/1/articles").should be_nil
    end

    it "should add a named route for the paged index route" do
      draw_routes { |map| map.resources :articles, :paged => true }
      named_routes.names.should include(:page_articles)
    end
    
    it "should observe the :path_prefix option in the paged route" do
      draw_routes { |map| map.resources :articles, :paged => true, :path_prefix => "foo" }
      recognise_path(:get, "/foo/pages/1/articles").should == { :controller => "articles", :action => "index", :page_id => "1" }
    end
    
    it "should observe a :namespace option in the paged route" do
      draw_routes { |map| map.resources :articles, :paged => true, :namespace => "bar/" }
      recognise_path(:get, "/pages/1/articles").should == { :controller => "bar/articles", :action => "index", :page_id => "1" }
    end
    
    it "should accept an :as option in the :paged option" do
      draw_routes { |map| map.resources :articles, :paged => { :as => "page" } }
      recognise_path(:get, "/page/1/articles").should == { :controller => "articles", :action => "index", :page_id => "1" }
    end
    
    it "should accept a :name option in the :paged option" do
      draw_routes { |map| map.resources :articles, :paged => { :name => :groups } }
      recognise_path(:get, "/groups/1/articles").should == { :controller => "articles", :action => "index", :group_id => "1" }
    end
    
    it "should accept a :name_prefix option in the paged route" do
      draw_routes { |map| map.resources :articles, :paged => true, :name_prefix => "baz_" }
      named_routes.names.should include(:baz_page_articles)
    end
    
    context "and nested resources" do
      it "should not change the nested routes" do
        drawing_routes do |map|
          map.resources :articles, :paged => true do |article|
            article.resources :comments
          end
        end.should change { number_of_routes }.by(7+1+7)
        drawing_routes do |map|
          map.resources :articles, :paged => true, :has_many => :comments
        end.should change { number_of_routes }.by(7+1+7)
      end
    end
  end
  
  context "with extra collection routes" do
    # TODO: test for :index in :except...?
    context "and an overall :paged option" do
      it "should map a paged route if the collection action is GET" do
        drawing_routes { |map| map.resources :memberships, :collection => { :paid => :get }, :paged => true }.should change { number_of_routes }.by(8+2)
      end
    
      it "should map a paged route if the collection action includes GET" do
        drawing_routes { |map| map.resources :memberships, :collection => { :paid => [ :get, :put ] }, :paged => true }.should change { number_of_routes }.by(9+2)
      end
    
      it "should not map a paged route if the collection action is not GET" do
        drawing_routes { |map| map.resources :memberships, :collection => { :paid => :put }, :paged => true }.should change { number_of_routes }.by(8+1)
      end
    
      it "should not map a paged route if the collection action does not include GET" do
        drawing_routes { |map| map.resources :memberships, :collection => { :paid => [ :put, :delete ] }, :paged => true }.should change { number_of_routes }.by(9+1)
      end
    
      it "should map a paged collection route for a GET method only" do
        draw_routes { |map| map.resources :memberships, :collection => { :paid => :get }, :paged => true }
        recognise_path(   :get, "/pages/1/memberships/paid").should == { :controller => "memberships", :action => "paid", :page_id => "1" }
        recognise_path(   :put, "/pages/1/memberships/paid").should be_nil
        recognise_path(  :post, "/pages/1/memberships/paid").should be_nil
        recognise_path(:delete, "/pages/1/memberships/paid").should be_nil
      end

      it "should add a named route for the paged collection route" do
        draw_routes { |map| map.resources :memberships, :collection => { :paid => :get }, :paged => true }
        named_routes.names.should include(:paid_page_memberships)
        # TODO: this should maybe be page_paid_memberships?
      end

      it "should observe the :path_prefix option in the paged route" do
        draw_routes { |map| map.resources :memberships, :collection => { :paid => :get }, :paged => true, :path_prefix => "foo" }
        recognise_path(:get, "/foo/pages/1/memberships/paid").should == { :controller => "memberships", :action => "paid", :page_id => "1" }
      end

      it "should observe a :namespace option in the paged route" do
        draw_routes { |map| map.resources :memberships, :collection => { :paid => :get }, :paged => true, :namespace => "bar/" }
        recognise_path(:get, "/pages/1/memberships/paid").should == { :controller => "bar/memberships", :action => "paid", :page_id => "1" }
      end

      it "should accept an :as option in the :paged option" do
        draw_routes { |map| map.resources :memberships, :collection => { :paid => :get }, :paged => { :as => "page" } }
        recognise_path(:get, "/page/1/memberships/paid").should == { :controller => "memberships", :action => "paid", :page_id => "1" }
      end

      it "should accept a :name option in the :paged option" do
        draw_routes { |map| map.resources :memberships, :collection => { :paid => :get }, :paged => { :name => :groups } }
        recognise_path(:get, "/groups/1/memberships/paid").should == { :controller => "memberships", :action => "paid", :group_id => "1" }
      end

      it "should accept a :name_prefix option in the paged route" do
        draw_routes { |map| map.resources :memberships, :collection => { :paid => :get }, :paged => true, :name_prefix => "baz_" }
        named_routes.names.should include(:paid_baz_page_memberships)
        # TODO: this should maybe be baz_page_paid_memberships?
      end
    end
    
    context "and a per-collection :paged options hash" do
      it "should add a paged route for each :get collection with a corresponding entry in the :paged hash" do
        drawing_routes { |map| map.resources :memberships, :collection => { :paid => :get, :unpaid => :get }, :paged => { :index => true, :paid => true } }.should change { number_of_routes }.by(9+2)
      end

      it "should accept an :as option in the :paged options hash" do
        draw_routes { |map| map.resources :memberships, :collection => { :paid => :get }, :paged => { :index => true, :paid => { :as => "page" } } }
        recognise_path(:get, "/pages/1/memberships").should == { :controller => "memberships", :action => "index", :page_id => "1" }
        recognise_path(:get, "/page/1/memberships/paid").should == { :controller => "memberships", :action => "paid", :page_id => "1" }
      end

      it "should accept a :name option in the :paged options hash" do
        draw_routes { |map| map.resources :memberships, :collection => { :paid => :get }, :paged => { :index => true, :paid => { :name => :groups } } }
        recognise_path(:get, "/pages/1/memberships").should == { :controller => "memberships", :action => "index", :page_id => "1" }
        recognise_path(:get, "/groups/1/memberships/paid").should == { :controller => "memberships", :action => "paid", :group_id => "1" }
      end
    end
  end
end