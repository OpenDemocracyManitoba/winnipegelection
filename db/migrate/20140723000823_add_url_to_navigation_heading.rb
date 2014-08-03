class AddUrlToNavigationHeading < ActiveRecord::Migration
  def change
    add_column :navigation_headings, :url, :string
  end
end
