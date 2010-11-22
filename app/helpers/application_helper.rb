module ApplicationHelper
  def toggle_button(enabled = false)
    return %Q{
      <label class="cb-enable#{" selected" if enabled}"><span>#{enabled ? "|" : "&#160;"}</span></label>
      <label class="cb-disable#{" selected" unless enabled}"><span>#{!enabled ? "O" : "&#160;"}</span></label>}.html_safe
  end
end
