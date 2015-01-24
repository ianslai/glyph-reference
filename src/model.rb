require_relative 'glyphs.rb'
require_relative 'database.rb'

class GlyphEntry
  attr_reader :homographs, :title, :symbol, :antonym, :desc, :shape, :segments

  def self.lookup(name)
    GLYPHS.include?(name) ? GlyphEntry.new(name.to_sym) : nil
  end

private

  def initialize(sym)
    @symbol = sym
    @homographs = find_homographs(sym)
    @title = sym.to_s.upcase
    @antonym = find_antonym(sym)
    @desc = DESCRIPTIONS[sym]
    @shape = find_category(sym, SHAPE_TYPES)
    @segments = find_category(sym, SEGMENTS_CATEGORY)
  end

  def find_homographs(sym)
    hgraphs = HOMOGRAPHS.find {|set| set.include?(sym) }
    if hgraphs
      hgraphs - [sym]
    else
      []
    end
  end

  def find_antonym(sym)
    pair = ANTONYMS.find {|set| set.include?(sym)}
    if pair
      (pair - [sym]).first
    else
      nil
    end
  end

  def find_category(sym, hash)
    entry = hash.find {|type, props| props[:glyphs].flatten.include?(sym) }
    if entry
      entry.first
    else
      nil
    end
  end

end

class Category
  attr_reader :title, :desc, :list

  def initialize(title, desc, category_hash)
    @title = title
    @desc = desc
    @list = category_hash.map {|key, hash|
      [key, hash[:desc], hash[:glyphs]]
    }
  end
end
