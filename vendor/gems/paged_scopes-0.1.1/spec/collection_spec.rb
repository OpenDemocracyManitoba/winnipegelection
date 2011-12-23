require File.dirname(__FILE__) + '/spec_helper'

describe "Collection" do
  describe "(ActiveRecord::Base class)" do
    it "should have a per_page setter and getter" do
      Article.per_page = 5
      Article.per_page.should == 5
    end
    
    it "should have a default page name of 'Page'" do
      Article.page_name.should == "Page"
    end

    it "should have a page_name setter and getter" do
      Article.page_name = "Group"
      Article.page_name.should == "Group"
    end
    
    it "should not have a #pages method" do
      Article.respond_to?(:pages).should be_false
    end
  end
  
  [ [ "association", "User.first.articles"                             ],
    [ "named scope", "Article.scoped(:conditions => 'title IS NULL')" ] ].each do |collection_type, collection|
    describe "(#{collection_type})" do
      before(:each) do
        @collection = eval(collection)
        Article.stub!(:per_page).and_return(10)
        Article.page_name = "Page"
      end
      
      it "should have a default per_page of the ActiveRecord::Base class" do
        @collection.per_page.should == 10
      end
    
      it "should have a per_page setter and getter" do
        @collection.per_page = 20
        @collection.per_page.should == 20
      end
      
      it "should not overwrite the ActiveRecord::Base per_page value when per_page is set" do
        @collection.per_page = 20
        Article.per_page.should == 10
      end
      
      it "should have a default page_name of the ActiveRecord::Base class" do
        @collection.page_name.should == "Page"
      end
    
      it "should have a page_name setter and getter" do
        @collection.page_name = "Group"
        @collection.page_name.should == "Group"
      end
      
      it "should not overwrite the ActiveRecord::Base page_name value when page_name is set" do
        @collection.page_name = "Group"
        Article.page_name.should == "Page"
      end
  
      it "should have a #pages method" do
        @collection.respond_to?(:pages).should be_true
      end
    end
  end
end