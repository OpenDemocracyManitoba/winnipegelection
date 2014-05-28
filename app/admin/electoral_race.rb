ActiveAdmin.register ElectoralRace do

  permit_params :region_id, :election_id, :polygon, :seats_to_fill
  
  index do
    selectable_column
    id_column
    column :name, sortable: true do |electoral_race|
      link_to electoral_race.name, edit_admin_electoral_race_path(electoral_race)
    end
    column :seats_to_fill
    column :polygon do |electoral_race|
      truncate electoral_race.polygon
    end
    column :updated_at
    default_actions
  end
  
end
