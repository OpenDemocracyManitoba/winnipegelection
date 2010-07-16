class Page < ActiveRecord::Base
  attr_accessible :title, :show_title, :permalink, :content
  
  def markup
    RDiscount.new(self.content, :smart).to_html
  end
end
