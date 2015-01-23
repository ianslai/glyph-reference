


class GlyphEntry
  attr_reader :homographs, :title, :shape, :antonym, :desc

  def initialize(db_entry)
    @homographs = db_entry[:homographs] || []
    @title = db_entry[:name]
    @shape = db_entry[:shape].to_s
    @antonym = db_entry[:antonym]
    @desc = db_entry[:desc]
  end

end