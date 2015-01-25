# Processor for textual data in the data/ directory
SECTION_REGEX = %r{#([^#]+)#?(.+)?}
GLYPH_TOKEN = /:([a-z-]+)/

class TextData
  attr_reader :sections, :refs
  
  def initialize(sections, refs)
    @sections = Hash[sections.map { |id, data|
      [id, TextSection.new(id, data[:title], data[:lines])]
    }]
    @refs = Hash[refs.map { |sym, ids|
      [sym, ids.uniq.map { |id| @sections[id] }]
    }]
  end

  def to_s(&postprocess)
    sections.map {|id, data|
      data.to_s do |lines|
        postprocess ? postprocess.call(lines) : lines
      end
    }.join("\n")
  end
end

class TextSection
  attr_reader :id, :title, :lines

  def initialize(id, title, lines)
    @id = id
    @title = title
    @lines = lines
  end

  def to_s(&postprocess)
    lines = @lines.join("\n")
    lines = postprocess.call(lines) if postprocess
    
    string = <<-EOL
<h2 id="#{@id}">#{@title}</h2>

#{lines}
    EOL
  end
end

class TextDataParser
  def initialize(file)
    root_path = File.dirname(File.dirname(__FILE__))
    data_path = File.join(root_path, 'data')
    @file = File.join(data_path, file)
  end

  def parse
    sections = [['', 'Top', []]]
    refs = {}
    File.readlines(@file).each do |line|
      line = line.chomp
      if line =~ SECTION_REGEX then
        id, section_title = $1, $2
        sections.push [id, section_title, []]
      else
        lines = sections.last.last
        line.scan(GLYPH_TOKEN).each do |glyph|
          sym = glyph.first.to_sym
          refs[sym] ||= []
          refs[sym].push sections.last.first
        end
        lines.push line
      end
    end
    sections = sections.reject {|id, title, lines| id.empty? }
    section_hash = Hash[sections.map do |id, title, lines|
      [id, {
        :title => title,
        :lines => lines,
      }]
    end]
    TextData.new(section_hash, refs)
  end

end
