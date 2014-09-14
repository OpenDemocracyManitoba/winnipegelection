class AddDisplayOrderToNavigationHeading < ActiveRecord::Migration
  def change
    add_column :navigation_headings, :display_order, :float
  end
end
