require_relative 'database'
require_relative 'textdata'

class ViewUtils
  def self.link(glyph)
    uri = "/glyphs/#{glyph}"
    text = display_name(glyph)
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
    text = display_name(glyph)
    link = <<-EOL
    <a href="#{uri}" class="glyph-link"><div class="glyph" data-name="#{glyph}"></div><span class="glyph-name">#{text}</span></a>
    EOL
  end

  def self.insert_links(text)
    text.gsub(GLYPH_TOKEN) { ViewUtils.link($1) }
  end

  def self.singletons_link()
    link = <<-EOL
    <a href="/singletons">Singletons</a>
    EOL
  end

  def self.unseen_link()
    link = <<-EOL
    <a href="/unseen">Unseen</a>
    EOL
  end

  def self.phrase_link(phrase)
    glyphs = phrase.map do |glyph|
      uri = "/glyphs/#{glyph}"
      link = <<-EOL
      <a href="#{uri}" class="glyph-link"><span class="mini-glyph" data-name="#{glyph}"></span></a>
      EOL
      link.strip
    end.join("")

    text = phrase.map do |glyph|
      uri = "/glyphs/#{glyph}"
      text = display_name(glyph)
      link = <<-EOL
      <a href="#{uri}" class="glyph-link"><span class="glyph-name">#{text}</span></a>
      EOL
      link.strip
    end.join(" ")

    "#{glyphs} #{text}"
  end

  def self.display_name(glyph)
    (DISPLAY_NAMES[glyph.to_sym] || glyph.to_s).downcase
  end
end
