class AddNavigationHeadingRefToPages < ActiveRecord::Migration
  def change
    add_reference :pages, :navigation_heading, index: true
  end
end
