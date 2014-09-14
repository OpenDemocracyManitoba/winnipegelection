class CreateNavigationHeadings < ActiveRecord::Migration
  def change
    create_table :navigation_headings do |t|
      t.string :name

      t.timestamps
    end
  end
end
