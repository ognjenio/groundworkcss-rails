module SocialGlyphHelper
  # ==== Examples
  # social_glyph(:dropbox, :large)
  # # => <i class="social-icon dropbox large"></i>
  # social_glyph(:dropbox)
  # # => <i class="social-icon dropbox"></i>

  def social_glyph(icon, *args)
  	size = args[0]
  	content_tag :i, nil, :class => "social-icon #{icon} #{size unless size.nil?}"
  end
end

