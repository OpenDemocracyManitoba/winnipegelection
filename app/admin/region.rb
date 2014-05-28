ActiveAdmin.register Region do

  permit_params :name, :start_date, :end_date, :region_type_id, :region_id, :seats
  
end
