ActiveAdmin.register Candidate do

  permit_params :name, :office_address, :phone_number, :email,
                :image, :website, :council_site, :facebook,
                :twitter, :youtube, :linkedin, :remove_image

  form :html => { :enctype => 'multipart/form-data' } do |f|
    f.inputs "Details", :multipart => true do
      f.input :name
      f.input :image, as: :file, :hint => f.object.image.present? \
        ? f.template.image_tag(f.object.image.url)
        : f.template.content_tag(:span, 'no profile image yet')
      f.input :image_cache, as: :hidden
      f.input :remove_image, as: :boolean
    end

    f.inputs "Contact" do
      f.input :email
      f.input :phone_number
      f.input :office_address
    end

    f.inputs "Online (Full URL including http://)" do
      f.input :website
      f.input :council_site
      f.input :facebook
      f.input :twitter
      f.input :youtube
      f.input :linkedin
    end

    f.actions  
  end  
end
