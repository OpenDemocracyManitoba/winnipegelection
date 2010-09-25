class CreateTrusteeCandidates < ActiveRecord::Migration
  def self.up
    create_table :trustee_candidates do |t|
      t.string :name
      t.integer :school_ward_id
      t.boolean :incumbent
      t.integer :incumbent_since
      t.string :website
      t.string :facebook
      t.string :twitter
      t.string :youtube
      t.string :phone_number
      t.string :email
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
      t.timestamps
    end
  end
  
  def self.down
    drop_table :trustee_candidates
  end
end
