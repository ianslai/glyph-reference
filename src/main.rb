require 'sinatra'
require "sinatra/reloader" if development?

set :root, File.dirname(File.dirname(__FILE__))

require_relative 'glyphs'
require_relative 'database'
require_relative 'model'
require_relative 'view_helper'

get '/?' do
  erb :home
end

get '/test/?' do
  @glyphs = GLYPHS
  erb :test
end

get '/glyphs/?' do
  @glyphs = GLYPHS.sort
  @title = 'Alphabetical listing'
  @header = 'Alphabetical listing of glyphs'
  erb :large
end

get '/glyphs/:glyph/?' do
  sym = params[:glyph].downcase.to_sym
  @glyph = GlyphEntry.lookup(sym)
  pass unless @glyph
  erb :glyph
end

get '/shapes/?' do
  @category = Category.new("Glyphs Sorted by Shape", nil, SHAPE_TYPES)
  erb :category
end

get '/segments/?' do
  desc = <<-EOL
  Each line between two points on the grid counts as a segment.
  For instance, the glyph for &ldquo;create&rdquo; is a line between 5 points, so
  it contains 4 segments.
  EOL
  @category = Category.new("Number of Segments", desc, SEGMENTS_CATEGORY)
  erb :category
end

get '/semantic/?' do
  @contents = SEMANTIC_ASSOCIATIONS.contents
  @toc = SEMANTIC_ASSOCIATIONS.toc
  erb :semantic
end

get '/singletons/?' do
  @glyphs = SINGLETONS.sort
  @title = @header = 'Singletons'
  @desc = 'These glyphs have only been seen in the wild as singletons, i.e. ' +
    'alone as a single-glyph phrase.'
  erb :large
end

get '/unseen/?' do
  @glyphs = UNSEEN.sort
  @title = @header = 'Unseen glyphs'
  @desc = 'Although these glyphs appear on the official reference that came out on the Ingress ' +
    'Google+ account, I have not seen these glyphs in the wild, or have seen the shapes only ' +
    'under other names.  If you have, please let me (somerian) know.'
  erb :large
end
