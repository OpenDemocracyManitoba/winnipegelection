ActiveAdmin.register ImageMapPolygon do
  permit_params :coordinates, :image_map_id, :electoral_race_id

  index do
    selectable_column
    id_column
    column :coordinates do |image_map_polygon|
      truncate image_map_polygon.coordinates
    end
    column :image_map
    column :electoral_race
    column :created_at
    column :updated_at
    actions
  end
end
