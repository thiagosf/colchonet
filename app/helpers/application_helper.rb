module ApplicationHelper
  def error_tag(model, attribute)
    if model.errors.has_key? attribute
      content_tag(
        :div,
        get_ul(model.errors[attribute]),
        class: 'error_message'
      )
    end
  end
  def get_ul(values)
    content_tag(
      :ul,
      values.map { |value| content_tag( :li, value ) }.join.html_safe
    )
  end
  def show_notice(notice)
    content_tag(:p, notice, id: "notice") if notice
  end
end
