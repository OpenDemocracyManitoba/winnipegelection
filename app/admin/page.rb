ActiveAdmin.register Page do

  permit_params :title, :content, :permalink, :show_title, :navigation_heading_id

  index do
    column :id
    column :title, sortable: :title do |page|
      link_to page.title, admin_page_path(page)
    end
    column :content do |page|
      truncate page.content
    end
    column :permalink do |page|
      link_to page.permalink, page.friendly_path
    end
    actions
  end

  show do
    h3 page.title
    div do
      markdown page.content
    end
    div do
      link_to page.title + " On Site", page.friendly_path
    end
  end

end
