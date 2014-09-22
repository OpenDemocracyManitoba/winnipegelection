ActiveAdmin.register NavigationHeading do
  permit_params :name, :url, :display_order, :navigation_heading_id

  index do
    selectable_column
    id_column
    column :name
    column :url
    column :display_order
    column :parent_heading do |heading|
      heading.parent_heading.name  if heading.parent_heading.present?
    end
    actions
  end
end
