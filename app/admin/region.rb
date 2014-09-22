ActiveAdmin.register Region do

  permit_params :name, :start_date, :end_date, :region_type_id,
                :region_id, :seats, :past_results, :official_document

  index do
    selectable_column
    id_column
    column :name, sortable: true do |region|
      link_to region.name_with_parent_and_type, edit_admin_region_path(region)
    end
    column :past_results do |region|
      region.past_results.present? ? 'present' : 'missing'
    end
    column :official_document do |region|
      link_to 'Official Doc', region.official_document  if region.official_document.present?
    end
    column :start_date
    column :end_date
    column :updated_at
    actions
  end

end
