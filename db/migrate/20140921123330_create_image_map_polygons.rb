class CreateImageMapPolygons < ActiveRecord::Migration
  def change
    create_table :image_map_polygons do |t|
      t.references :image_map, index: true
      t.references :electoral_race, index: true
      t.text :coordinates

      t.timestamps
    end
  end
end
