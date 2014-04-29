ActiveAdmin.register Candidacy do

  permit_params :questionnaire, :end_date, :is_incumbent, :is_winner, :person_id, :electoral_race_id
  
end
