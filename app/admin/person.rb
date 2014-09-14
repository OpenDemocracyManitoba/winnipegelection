ActiveAdmin.register Person do

  permit_params :name, :office_address, :phone_number, :email,
                :image, :website, :council_site, :facebook,
                :twitter, :youtube, :linkedin, :remove_image,
                :also_known_as

  form :html => { :enctype => 'multipart/form-data' } do |f|
    f.inputs "Details", :multipart => true do
      f.input :name
      f.input :also_known_as
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
    selectable_column
    id_column
    column :name, sortable: :name do |person|
      link_to person.name, edit_admin_person_path(person)
    end
    column :also_known_as
    column :image do |person|
      image_tag person.image.tiny.url
    end
    column :email do |person|
      mail_to person.email  if person.email.present?
    end
    column :phone_number
    column :office_address do |person|
      truncate person.office_address
    end
    column 'Online' do |p|
      [:website, :council_site, :facebook, :twitter, :youtube, :linkedin].each do |site|
        span do
          # Link to all websites. Link text is first letter of site type. Title attribute is site type.
          link_to_if p[site].present?, site.to_s[0].capitalize, p[site], title: site.to_s
        end
      end
    end
    column 'Most Recent Candidacy' do |p|
      if p.candidacies.empty?
        span { "Missing!" }
      else
        most_recent_candidacy = p.candidacies.last
        link_to most_recent_candidacy.electoral_race.name, edit_admin_candidacy_path(most_recent_candidacy)
      end
    end
    column :updated_at
    default_actions
  end
end
