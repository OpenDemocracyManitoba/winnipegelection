ActiveAdmin.register Region do

  permit_params :name, :start_date, :end_date, :region_type_id, :region_id, :seats
  
  index do
    selectable_column
    id_column
    column :name, sortable: true do |region|
      link_to region.name_with_type, edit_admin_region_path(region)
    end
    column :start_date
    column :end_date
    column :updated_at
    default_actions
  end
  
end
