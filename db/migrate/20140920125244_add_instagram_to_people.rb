class AddInstagramToPeople < ActiveRecord::Migration
  def change
    add_column :people, :instagram, :string
  end
end
