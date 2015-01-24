require_relative 'glyphs.rb'
require_relative 'database.rb'

class GlyphEntry
  attr_reader :homographs, :title, :symbol, :antonym, :desc, :shape

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
    @shape = find_shape(sym)
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

  def find_shape(sym)
    shape = SHAPE_TYPES.find {|type, props| props[:glyphs].flatten.include?(sym) }
    if shape
      shape.first
    else
      nil
    end
  end
end

class Category
  attr_reader :title, :list

  def initialize(title, category_hash)
    @title = title
    @list = category_hash.map {|key, hash|
      [key, hash[:desc], hash[:glyphs]]
    }
  end
end
