class AddNavigationHeadingRefToPerson < ActiveRecord::Migration
  def change
    add_reference :people, :navigation_heading, index: true
  end
end
