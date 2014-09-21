module ApplicationHelper
  def markdown(marked_down_content)
    @redcarpet ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    @redcarpet.render(marked_down_content).html_safe
  end

  def markdown_with_tables(marked_down_content)
    @redcarpet ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, tables: true)
    @redcarpet.render(marked_down_content).html_safe
  end
end
