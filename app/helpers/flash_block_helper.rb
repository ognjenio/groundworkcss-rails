module FlashBlockHelper
  def flash_block
    output = ''
    flash.each do |type, message|
      output += flash_container(type, message)
    end

    raw(output)
  end

  def flash_container(type, message)
  	# Types: important, success, warning, error
    raw(content_tag(:p, :class => "message #{type}") do
      message
    end)
  end
end
