ActiveAdmin.register ElectoralRace do

  permit_params :region_id, :election_id, :polygon, :seats_to_fill, :navigation_heading_id

  index do
    selectable_column
    id_column
    column :name, sortable: true do |electoral_race|
      link_to electoral_race.name_with_type_parent_and_year,
              edit_admin_electoral_race_path(electoral_race)
    end
    column :seats_to_fill
    column :polygon do |electoral_race|
      truncate electoral_race.polygon
    end
    column :updated_at
    default_actions
  end

  form do |f|
    f.inputs "Electoral Race" do
      f.input :navigation_heading
      f.input :region, as: :select, collection: Region.all.map{ |r| [r.name_with_parent_and_type, r.id]}
      f.input :election
      f.input :polygon
      f.input :seats_to_fill
    end
    f.actions
  end

end
