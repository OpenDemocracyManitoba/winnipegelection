module FriendlyURL
  extend ActiveSupport::Concern

  # Builds a friendly URL that includes the permalink
  # Used like this: link_to page.title, page.friendly_path
  def friendly_path
    "/#{controller_name}/#{self.id}/#{self.slug}"
  end

  module ClassMethods
    # Finds page by id, but throws an exception if the permalink slug from the
    # URL doesn't match the page permalink.
    def friendly_find(params)
      object = find(params[:id])
      if object.slug != params[:slug]
        fail ActiveRecord::RecordNotFound
      else
        object
      end
    end
  end

  private
  
  def controller_name
    self.class.to_s.tableize
  end
end
