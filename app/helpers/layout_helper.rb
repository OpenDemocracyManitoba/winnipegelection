module LayoutHelper
  def title(page_title)
    return  if page_title.blank?
    content_for(:title) { h(page_title) }
    @title_set = true
  end

  def title_set?
    defined?(@title_set)
  end
end
