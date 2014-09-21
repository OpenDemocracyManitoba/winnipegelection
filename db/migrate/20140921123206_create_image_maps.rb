class CreateImageMaps < ActiveRecord::Migration
  def change
    create_table :image_maps do |t|
      t.string :name
      t.string :image

      t.timestamps
    end
  end
end
