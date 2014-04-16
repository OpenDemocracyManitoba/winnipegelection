ActiveAdmin.register Candidate do

  permit_params :name, :office_address, :phone_number, :email,
                :image, :website, :council_site, :facebook,
                :twitter, :youtube, :linkedin, :remove_image

  form :html => { :enctype => 'multipart/form-data' } do |f|
    f.inputs "Details", :multipart => true do
      f.input :name
      f.input :image, as: :file, :hint => f.object.image.present? \
        ? f.template.image_tag(f.object.image.tiny.url)
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

  index do
    column :id
    column :name, sortable: true do |candidate|
      link_to candidate.name, edit_admin_candidate_path(candidate)
    end
    column :image do |candidate|
      image_tag candidate.image.tiny.url
    end
    column :email do |candidate|
      mail_to candidate.email  if candidate.email.present?
    end
    column :phone_number
    column :office_address do |candidate|
      truncate candidate.office_address
    end
    column 'Online' do |c|
      [:website, :council_site, :facebook, :twitter, :youtube, :linkedin].each do |site|
        span do
          # Link to all websites. Link text is first letter of site type. Title attribute is site type.
          link_to_if c[site].present?, site.to_s[0].capitalize, c[site], title: site.to_s
        end
      end
    end
    default_actions
  end
end
