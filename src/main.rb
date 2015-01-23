require 'sinatra'
require "sinatra/reloader" if development?

set :root, File.dirname(File.dirname(__FILE__))

require_relative 'glyphs'
require_relative 'database'
require_relative 'model'
require_relative 'view_helper'

get '/test/?' do
  @glyphs = GLYPHS
  erb :test
end

get '/glyphs/:glyph/?' do
  glyph = params[:glyph].downcase.to_sym
  data = DATABASE[glyph]

  # For now, create stub page
  if !data && GLYPHS.include?(glyph.to_s)
    data = {
      :name => glyph.to_s.upcase,
      :shape => glyph,
      :homographs => [],
      :desc => "This is a stub page for a glyph that has not been entered into the database.",
      :links => {
      },
    }
  end
  pass unless data
  @glyph = GlyphEntry.new(data)
  erb :glyph
end
