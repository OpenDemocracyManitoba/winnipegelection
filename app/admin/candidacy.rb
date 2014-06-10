ActiveAdmin.register Candidacy do

  permit_params :questionnaire, :end_date, :is_incumbent, :is_winner, :person_id, :electoral_race_id

  index do
    selectable_column
    id_column
    column :name, sortable: true do |candidacy|
      link_to candidacy.name_with_electoral_race, edit_admin_candidacy_path(candidacy)
    end
    column :questionnaire do |candidacy|
      truncate candidacy.questionnaire
    end
    column :is_incumbent
    column :is_winner
    column :updated_at
    default_actions
  end
end
