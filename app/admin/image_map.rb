ActiveAdmin.register ImageMap do
  permit_params :name, :image, :all_candidates_url

  index do
    selectable_column
    id_column
    column :name
    column :image do |image_map|
      image_tag image_map.image.small.url
    end
    column :all_candidates_url do |image_map|
      if image_map.all_candidates_url.present?
        link_to 'All Candidates', image_map.all_candidates_url
      end
    end
    column :created_at
    column :updated_at
    actions
  end

  show do
    render partial: 'image_maps/image_map', object: image_map
  end

end
