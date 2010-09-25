class CreateSchoolDivisions < ActiveRecord::Migration
  def self.up
    create_table :school_divisions do |t|
      t.string :name
      t.text :description
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
      t.timestamps
    end
  end
  
  def self.down
    drop_table :school_divisions
  end
end
