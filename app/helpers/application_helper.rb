module ApplicationHelper
  def page_title(title)
    title.blank? ? 'ヒラメク！' : "ヒラメク！|#{title} "
  end
end
