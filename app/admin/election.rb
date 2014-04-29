ActiveAdmin.register Election do

  permit_params :name, :is_active, :is_by_election, :writ_date, :election_date
  
end
