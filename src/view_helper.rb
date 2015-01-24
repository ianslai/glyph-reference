require_relative 'database'

class ViewUtils
  def self.link(glyph)
    uri = "/glyphs/#{glyph}"
    text = glyph.to_s.downcase
    link = <<-EOL
    <a href="#{uri}"><span class="mini-glyph" data-name="#{glyph}"></span> <span class="glyph-name">#{text}</span></a>
    EOL
  end

  def self.shape_link(shape)
    props = SHAPE_TYPES[shape]
    desc = props[:desc].downcase
    link = <<-EOL
    <a href="/shapes/&#35;#{shape}" class="category">#{desc}</a>
    EOL
  end
end
