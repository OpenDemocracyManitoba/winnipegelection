ActiveAdmin.register Candidacy do

  permit_params :questionnaire, :end_date, :is_incumbent, :is_winner, :person_id, :electoral_race_id

  index do
    selectable_column
    id_column
    column :name, sortable: true do |candidacy|
      link_to candidacy.person_name_with_electoral_race, edit_admin_candidacy_path(candidacy)
    end
    column :questionnaire do |candidacy|
      truncate candidacy.questionnaire
    end
    column :is_incumbent
    column :is_winner
    column :updated_at
    actions
  end

  form do |f|
    f.inputs "Candidacy" do
      f.input :electoral_race, as: :select, collection: ElectoralRace.all.sort_by(&:name)
      f.input :person, as: :select, collection: Person.order(:name).all
      f.input :questionnaire
      f.input :end_date
      f.input :is_incumbent
      f.input :is_winner
    end
    f.actions
  end
end
