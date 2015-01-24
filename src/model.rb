require_relative 'glyphs.rb'
require_relative 'database.rb'

class GlyphEntry
  attr_reader :homographs, :title, :shape, :antonym, :desc

  def self.lookup(name)
    GLYPHS.include?(name) ? GlyphEntry.new(name.to_sym) : nil
  end

private

  def initialize(sym)
    @homographs = find_homographs(sym)
    @title = sym.to_s.upcase
    @shape = sym
    @antonym = find_antonym(sym)
    @desc = DESCRIPTIONS[sym]
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
end