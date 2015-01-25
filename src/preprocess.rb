# Preprocessing of page templates to extract references to glyphs
require_relative 'textdata.rb'
require_relative 'view_helper.rb'

class TextDataView
  def initialize(file, uri, title)
    @textdata = TextDataParser.new(file).parse
    @uri = uri
    @page_title = title
  end

  def toc
    section_items = @textdata.sections.values.map {|section|
      item = <<-EOL
      <li><a href="&#35;#{section.id}">#{section.title}</a>
      EOL
    }
    toc = <<-EOL
    <ul>
      #{section_items.join("\n")}
    </ul>
    EOL
  end

  def contents
    @textdata.to_s do |lines|
      ViewUtils.insert_links(lines)
    end
  end

  def section(sym)
    section = @textdata.sections[sym.to_s]    
    if section
      section.lines.map do |lines|
        ViewUtils.insert_links(lines)
      end.join("\n")
    else
      nil
    end
  end

  def ref_links(sym)
    refs = @textdata.refs[sym] || []
    refs.map do |section|
      anchor = "&#35;#{section.id}"
      link = <<-EOL
<a href="#{@uri}#{anchor}">#{@page_title} (#{section.title})</a>
      EOL
    end
  end
end

SEMANTIC_ASSOCIATIONS = TextDataView.new('semantic.erb', '/semantic', 'Semantic associations')
DESCRIPTIONS = TextDataView.new('desc.erb', '/', 'Descriptions')
