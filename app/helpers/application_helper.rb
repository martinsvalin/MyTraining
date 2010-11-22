module ApplicationHelper
  def toggle_button(enabled = false)
    return %Q{
      <label class="cb-enable#{" selected" if enabled}"><span>On</span></label>
      <label class="cb-disable#{" selected" unless enabled}"><span>Off</span></label>}.html_safe
  end
end
