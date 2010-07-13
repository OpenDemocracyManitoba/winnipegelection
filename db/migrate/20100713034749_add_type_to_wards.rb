class AddTypeToWards < ActiveRecord::Migration
  def self.up
    add_column :wards, :ward_type, :string
  end

  def self.down
    remove_column :wards, :ward_type
  end
end
