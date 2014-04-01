module AdminHelper
  def show_alert(div_class="danger")
    content_tag(:div, flash[:alert], class: "alert alert-#{div_class}") if flash[:alert]
  end
end
