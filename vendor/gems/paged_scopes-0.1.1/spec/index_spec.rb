require File.dirname(__FILE__) + '/spec_helper'

describe "Indexing" do
  in_contexts do
    it "should know the index of an object in the collection" do
      @articles.all.each_with_index do |article, index|
        @articles.index_of(article).should == index
      end
    end
    
    it "should raise an error if asked for the index of an object not in the collection" do
      (Article.all - @articles.all).each do |article|
        lambda { @articles.index_of(article) }.should raise_error(ActiveRecord::RecordNotFound)
      end
    end

    it "should know the object after an object in the collection" do
      articles = @articles.all
      until articles.empty? do
        @articles.after(articles.shift).should == articles.first
      end
    end

    it "should know the object before an object in the collection" do
      articles = @articles.all
      until articles.empty? do
        @articles.before(articles.pop).should == articles.last
      end
    end
  end  
end
