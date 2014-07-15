ActiveAdmin.register NewsSource do
  permit_params :name, :base_url, :is_local_source
  scope :all, :default => true
  scope :local do |news_sources|
    news_sources.where(is_local_source: true)
  end
  scope :not_local do |news_sources|
    news_sources.where(is_local_source: false)
  end

  controller do
    def toggle_is_local_source
      @news_source = NewsSource.find(params[:id])
      @news_source.is_local_source = !@news_source.is_local_source
      @news_source.save
      respond_to do |format|
        format.js
      end
    end
  end

  index do
    column :id
    column :name
    column :base_url do |news_source|
      link_to news_source.base_url, news_source.base_url
    end
    column :is_local_source
    actions defaults: true do |news_source|
      link_to 'local?', admin_toggle_is_local_source_path(news_source), method: :patch, remote: true
    end
  end
end
