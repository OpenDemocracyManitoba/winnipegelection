class CreateWards < ActiveRecord::Migration
  def self.up
    create_table :wards do |t|
      t.string :name
      t.string :pdf_map_url
      t.timestamps
    end
  end
  
  def self.down
    drop_table :wards
  end
end
