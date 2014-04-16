class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :office_address
      t.string :phone_number
      t.string :email
      t.string :image
      t.string :website
      t.string :council_site
      t.string :facebook
      t.string :twitter
      t.string :youtube
      t.string :linkedin

      t.timestamps
    end
  end
end
