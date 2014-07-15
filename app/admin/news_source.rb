ActiveAdmin.register NewsSource do
  permit_params :name, :base_url, :is_local_source
end
