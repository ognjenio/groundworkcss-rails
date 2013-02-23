module FlashHelper
  ALERT_TYPES = [:error, :success, :warning]

  def groundwork_flash
    flash_messages = []
    flash.each do |type, message|
      next if message.blank?
      
      type = :success if type == :notice
      type = :error   if type == :alert
      next unless ALERT_TYPES.include?(type)

      Array(message).each do |msg|
        text = content_tag(:p,
                           msg.html_safe, :class => "message #{type}")
        flash_messages << text if message
      end
    end
    flash_messages.join("\n").html_safe
  end
end
