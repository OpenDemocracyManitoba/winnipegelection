module LayoutHelper
  def title(page_title)
    content_for(:title) { page_title.blank? ? '' : h(" - #{page_title}") }
  end
end
