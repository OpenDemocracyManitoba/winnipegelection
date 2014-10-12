module LayoutHelper
  def title(page_title)
    return  if page_title.blank?
    content_for(:title) { h(page_title) }
    @title_set = true
  end

  def title_set?
    defined?(@title_set)
  end

  def meta_description(description)
    return  if description.blank?
    content_for(:meta_description) { h(description) }
    @meta_description_set = true
  end

  def meta_description_set?
    defined?(@meta_description_set)
  end
end
