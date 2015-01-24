require_relative 'database'

class ViewUtils
  def self.link(glyph)
    uri = "/glyphs/#{glyph}"
    text = glyph.to_s.downcase
    link = <<-EOL
    <a href="#{uri}" class="glyph-link"><span class="mini-glyph" data-name="#{glyph}"></span>&nbsp;<span class="glyph-name">#{text}</span></a>
    EOL
  end

  def self.shape_link(shape)
    props = SHAPE_TYPES[shape]
    desc = props[:desc].downcase
    link = <<-EOL
    <a href="/shapes/&#35;#{shape}" class="category">#{desc}</a>
    EOL
  end

  def self.large_link(glyph)
    uri = "/glyphs/#{glyph}"
    text = glyph.to_s.downcase
    link = <<-EOL
    <a href="#{uri}" class="glyph-link"><div class="glyph" data-name="#{glyph}"></div>&nbsp;<span class="glyph-name">#{text}</span></a>
    EOL
  end
end
