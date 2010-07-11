class CreateCandidates < ActiveRecord::Migration
  def self.up
    create_table :candidates do |t|
      t.string :name
      t.integer :ward_id
      t.integer :incumbent_since
      t.string :website
      t.string :facebook
      t.string :twitter
      t.string :youtube
      t.string :office_address
      t.string :phone_number
      t.string :email
      t.string :image_url
      t.datetime :dob
      t.timestamps
    end
  end
  
  def self.down
    drop_table :candidates
  end
end
