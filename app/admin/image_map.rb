ActiveAdmin.register ImageMap do
  permit_params :name, :image

  index do
    selectable_column
    id_column
    column :name
    column :image do |image_map|
      image_tag image_map.image.small.url
    end
    column :created_at
    column :updated_at
    default_actions
  end

  show do
    render partial: 'image_maps/image_map', object: image_map
  end

end
