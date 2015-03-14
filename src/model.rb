require_relative 'glyphs.rb'
require_relative 'database.rb'
require_relative 'preprocess.rb'
require_relative 'phrases.rb'
require_relative 'view_helper'

class GlyphEntry
  attr_reader :homographs, :title, :symbol, :antonyms, :desc, :shape, :segments, :see_alsos, :phrases

  def self.lookup(name)
    GLYPHS.include?(name) ? GlyphEntry.new(name.to_sym) : nil
  end

private

  def initialize(sym)
    @symbol = sym
    @homographs = find_homographs(sym)
    @title = sym.to_s.upcase
    @antonyms = find_antonyms(sym)
    @desc = DESCRIPTIONS.section(sym)
    @shape = find_category(sym, SHAPE_TYPES)
    @segments = find_category(sym, SEGMENTS_CATEGORY)
    @see_alsos = find_see_alsos(sym)
    @phrases = find_phrases(sym)
  end

  def find_homographs(sym)
    hgraphs = HOMOGRAPHS.find {|set| set.include?(sym) }
    if hgraphs
      hgraphs.sort - [sym]
    else
      []
    end
  end

  def find_antonyms(sym)
    # Antonyms are defined as pairs where either side could be
    # a single glyph or a list of glyphs. Find the glyphs on the
    # opposite sides.
    pairs = ANTONYMS.select {|set| set.flatten.include?(sym)}
    antonyms = pairs.map do |pair|
      [pair.first].flatten.include?(sym) ? pair.last : pair.first
    end.flatten.sort
  end

  def find_category(sym, hash)
    entry = hash.find {|type, props| props[:glyphs].flatten.include?(sym) }
    if entry
      entry.first
    else
      nil
    end
  end

  def find_see_alsos(sym)
    links = [SEMANTIC_ASSOCIATIONS].map do |page|
      page.ref_links(sym)
    end.flatten

    links.push ViewUtils.singletons_link if SINGLETONS.include?(sym)
    links.push ViewUtils.unseen_link if UNSEEN.include?(sym)

    links
  end

  def find_phrases(sym)
    (PHRASES_REF[sym] || []).map { |phrase| PhraseReference.new(phrase) }
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

class PhraseReference
  def initialize(phrase)
    @phrase = phrase
  end

  def to_s
    @phrase.map {|glyph| ViewUtils.link(glyph) }.join(' ')
  end
end
