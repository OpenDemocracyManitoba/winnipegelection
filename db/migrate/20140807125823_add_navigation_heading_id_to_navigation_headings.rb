class AddNavigationHeadingIdToNavigationHeadings < ActiveRecord::Migration
  def change
    add_reference :navigation_headings, :navigation_heading, index: true
  end
end
