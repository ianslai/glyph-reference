
# Correspondences for glyphs that have the same shape
HOMOGRAPHS = [
  [:accept, :open],
  [:balance, :perfection],
  [:breathe, :live],
  [:evolution, :progress, :success],
  [:harmony, :peace],
  [:not, :inside],
  [:now, :present],
  [:outside, :distance],
  [:repeat, :again],
  [:thought, :idea],
  [:stability, :stay],
  [:struggle, :resistance],
  [:war, :attack],
]

# Glyphs with opposite meanings
ANTONYMS = [
  [:peace, :war],
  [:attack, :defend],
  [:advance, :retreat],
  [:question, :answer],
  [:path, :barrier],
  [:live, :die],
  [:capture, :liberate],
  [:complex, :simple],
  [:courage, :fear],
  [:create, :destroy],
  [:improve, :deteriorate],
  [:easy, :difficult],
  [:grow, :reduce],
  [:outside, :inside],
  [:enlightened, :resistance],
  [:success, :failure],
  [:lead, :follow],
  [:past, :future],
  [:gain, :lose],
  [:pure, :impure],
  [:less, :more],
  [:civilization, :nature],
  [:old, :new],
  [:truth, :lie],
  [:weak, :strong],
]

# Glyphs sorted by shape
SHAPE_TYPES = {
  :line => {
    :desc => "Linear",
    :glyphs => [
      [:clear, :advance, :retreat, :create, :destroy,],
      [:simple, :see, :gain, :lose, :forget, :ignore],
    ],
  },

  :polygonal => {
    :desc => "Polygonal",
    :glyphs => [
      [:accept, :open, :nourish, :repair],
      [:mind, :body, :soul, :end],
      [:strong, :human, :xm, :all],
    ],
  },

  :horseshoe => {
    :desc => "Horseshoe",
    :glyphs => [
      [:past, :present, :now, :equal, :future],
      [:safety, :stability, :stay,],
      [:discover, :potential, :have, ],
    ],
  },

  :hook => {
    :desc => "Hook",
    :glyphs => [
      [:save, :weak, :answer, :fear, :courage],
      [:danger, :question, :escape, :help],
      [:capture, :liberate, :lead],
    ],
  },

  :em => {
    :desc => "M-shaped",
    :glyphs => [[:again, :repeat, :avoid, ]],
  },

  :en => {
    :desc => "N-shaped",
    :glyphs => [
      [:data, :message, :rebel],
      [:change, :complex, :pursue, :want],
      [:evolution, :progress, :success, :failure, :follow]
    ],
  },

  :vee => {
    :desc => "V-shaped",
    :glyphs => [
      [:attack, :war, :defend, :live, :breathe, :die, :self],
      [:more, :less, :old, :new, :inside, :not],
      [:grow, :reduce],
      [:distance, :outside, :path, :barrier, :easy],
      [:deteriorate, :improve, :react, :restraint, :use],
    ],
  },

  :wand => {
    :desc => "Wand",
    :glyphs => [[:balance, :perfection, :harm, :impure, :pure, :imperfect, :together]],
  },

  :spiral => {
    :desc => "Spiral",
    :glyphs => [[:search, :contemplate, :enlightened]],
  },

  :bowtie => {
    :desc => "Bowtie",
    :glyphs => [[:truth, :lie, :peace, :harmony, :portal, :idea, :thought]],
  },

  :complex => {
    :desc => "Complex",
    :glyphs => [
      [:chaos, :journey, :hide,],
      [:shapers, :civilization, :nature, :conflict, :difficult],
      [:separate, :destiny, :resistance, :struggle, ],
    ],
  },

  :compound => {
    :desc => "Compound",
    :glyphs => [[:'clear-all', :'open-all', ]],
  },
}

SEGMENTS = {
  1 => [:forget, :gain, :ignore, :lose, :see, :simple],
  2 => [:advance, :clear, :distance, :grow, :inside, :less, :more, :new, :old, :reduce, :retreat, :self, :use],
  3 => [:answer, :barrier, :body, :change, :complex, :courage, :danger, :deteriorate, :discover,
        :easy, :equal, :failure, :fear, :follow, :future, :have, :improve, :open, :past, :path,
        :present, :pursue, :question, :safety, :save, :stay, :success, :want, :weak],
  4 => [:attack, :avoid, :create, :data, :defend, :destroy, :die, :difficult, :escape,
        :help, :hide, :impure, :lead, :live, :message, :mind, :nourish,
        :potential, :pure, :react, :repair, :search, :soul, :strong],
  5 => [:again, :capture, :civilization, :conflict, :destiny, :end, :human,
        :liberate, :lie, :nature, :rebel, :resistance, :restraint, :together, :xm],
  6 => [:all, :harm, :journey, :separate, :shapers, :truth],
  7 => [:chaos, :contemplate, :enlightened, :perfection],
  8 => [:"clear-all", :idea, :peace, :portal],
  9 => [:"open-all"],
}

# include homographs in segments listing
SEGMENTS.each do |num, glyphs|
  SEGMENTS[num] = glyphs.map {|glyph|
    HOMOGRAPHS.find{|h| h.include?(glyph)} || glyph
  }.flatten.sort.uniq
end

SEGMENTS_CATEGORY = lambda {
  segments = SEGMENTS.map { |num, glyphs|
    [
      :"segments#{num}",
      {
        :desc => "#{num} segment#{num > 1 ? 's' : ''}",
        :glyphs => [ glyphs ],
      }
    ]
  }
  segments.push [
    :"segments4sortof",
    {
      :desc => "4 segments (sort of)",
      :glyphs => [[:imperfect]],
    }
  ]
  Hash[segments.sort]
}.call
