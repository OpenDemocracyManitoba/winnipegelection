require File.dirname(__FILE__) + '/spec_helper'

describe "Context" do
  in_contexts do
    it "should know the object after an object obtained with #all" do
      articles = @articles.all
      until articles.empty? do
        articles.shift.next.should == articles.first
      end
    end

    it "should know the object before an object obtained with #all" do
      articles = @articles.all
      until articles.empty? do
        articles.pop.previous.should == articles.last
      end
    end
    
    it "should be known for an object obtained with #first" do
      @articles.all.should have_at_least(2).articles
      @articles.first.next.should_not be_nil
      @articles.first.previous.should be_nil
    end
    # (For a collection including :limit , this won't work with #last unless the collection
    # has been evaluated already!)
  end
end