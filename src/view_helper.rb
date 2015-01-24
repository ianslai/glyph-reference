require_relative 'database'

class ViewUtils
  def self.link(glyph)
    uri = "/glyphs/#{glyph}"
    text = glyph.to_s.downcase
    "<a href=\"#{uri}\"><span class=\"glyph-name\">#{text}</span></a>"
  end
end
