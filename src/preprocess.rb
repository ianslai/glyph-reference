# Preprocessing of page templates to extract references to glyphs

SECTION_REGEX = %r{<h2 id="(.+?)">(.+?)</h2>}i
GLYPH_TOKEN = /:([a-z-]+)/

class PageSectionParser
  def initialize(file)
    root_path = File.dirname(File.dirname(__FILE__))
    view_path = File.join(root_path, 'views')
    @page_title, @refs = parse(File.join(view_path, file))
  end

  def parse(file)
    sections = [['', 'Top']]
    refs = {}
    page_title = 'Untitled'
    File.readlines(file).each do |line|
      if line =~ %r{<h1>(.+?)</h1>}i then
        page_title = $1
      elsif line =~ SECTION_REGEX then
        id, title = $1, $2
        sections.push [id, title]
      else
        line.scan(GLYPH_TOKEN).each do |glyph|
          sym = glyph.first.to_sym
          refs[sym] ||= []
          refs[sym].push sections.last
        end
      end
    end
    [page_title, refs]
  end

  def generate_links(uri)
    Hash[@refs.map do |glyph, sections|
      links = sections.uniq.map do |id, title|
        anchor = id.empty? ? '' : "&#35;#{id}"
        link = <<-EOL
        <a href="#{uri}#{anchor}">#{@page_title} (#{title})</a>
        EOL
        link.strip
      end
      [glyph, links]
    end]
  end
end

SEMANTIC_ASSOCIATIONS = PageSectionParser.new('semantic.erb').generate_links("/semantic")
