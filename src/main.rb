require 'sinatra'
require "sinatra/reloader" if development?

set :root, File.dirname(File.dirname(__FILE__))

require_relative 'glyphs'
require_relative 'database'
require_relative 'model'
require_relative 'view_helper'

get '/?' do
  @glyphs = [:message, :data]
  erb :test
end

get '/test/?' do
  @glyphs = GLYPHS
  erb :test
end

get '/glyphs/?' do
  @glyphs = GLYPHS.sort
  erb :alpha
end

get '/glyphs/:glyph/?' do
  sym = params[:glyph].downcase.to_sym
  puts sym
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
