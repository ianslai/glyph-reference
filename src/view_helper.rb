require_relative 'preprocess'
require_relative 'database'

class ViewUtils
  def self.link(glyph)
    uri = "/glyphs/#{glyph}"
    text = glyph.to_s.downcase
    link = <<-EOL
    <a href="#{uri}" class="glyph-link"><span class="mini-glyph" data-name="#{glyph}"></span>&nbsp;<span class="glyph-name">#{text}</span></a>
    EOL
  end

  def self.category_link(type, uri, hash)
    props = hash[type]
    desc = props[:desc]
    link = <<-EOL
    <a href="#{uri}/&#35;#{type}" class="category">#{desc}</a>
    EOL
  end

  def self.large_link(glyph)
    uri = "/glyphs/#{glyph}"
    text = glyph.to_s.downcase
    link = <<-EOL
    <a href="#{uri}" class="glyph-link"><div class="glyph" data-name="#{glyph}"></div><span class="glyph-name">#{text}</span></a>
    EOL
  end

  def self.insert_links(text)
    text.gsub(GLYPH_TOKEN) { ViewUtils.link($1) }
  end

  def self.insert_toc(text)
    sections = text.scan(SECTION_REGEX)
    section_items = sections.map {|id, title|
      item = <<-EOL
      <li><a href="&#35;#{id}">#{title}</a>
      EOL
    }
    toc = <<-EOL
    <ul>
      #{section_items.join("\n")}
    </ul>
    EOL
    text.sub(%r{<insert-toc/>}, toc)
  end
end
