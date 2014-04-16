ActiveAdmin.register Candidate do

  permit_params :name, :office_address, :phone_number, :email,
                :image, :website, :council_site, :facebook,
                :twitter, :youtube, :linkedin
  
end
