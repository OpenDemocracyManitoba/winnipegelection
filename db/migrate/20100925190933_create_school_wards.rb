class CreateSchoolWards < ActiveRecord::Migration
  def self.up
    create_table :school_wards do |t|
      t.string :name
      t.text :description
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
      t.integer :school_division_id
      t.integer :seats
      t.timestamps
    end
  end
  
  def self.down
    drop_table :school_wards
  end
end
