
# Correspondences for glyphs that have the same shape
HOMOGRAPHS = [
  [:accept, :open],
  [:balance, :perfection],
  [:breathe, :live],
  [:evolution, :progress, :success],
  [:harmony, :peace],
  [:i, :me],
  [:not, :inside],
  [:now, :present],
  [:outside, :distance],
  [:reduce, :contract],
  [:repair, :recharge],
  [:repeat, :again],
  [:thought, :idea, :creativity],
  [:self, :individual],
  [:stability, :stay],
  [:struggle, :resistance],
  [:us, :we],
  [:war, :attack],
  [:you, :your],
]

# Glyphs with opposite meanings
ANTONYMS = [
  [:abandon, :restraint],
  [:begin, :end],
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
  [[:i, :me], :you],
  [:improve, :deteriorate],
  [:easy, :difficult],
  [:grow, [:contract, :reduce]],
  [:outside, :inside],
  [[:enlightened, :enlightenment], :resistance],
  [:success, :failure],
  [:lead, :follow],
  [:past, :future],
  [:gain, :lose],
  [:pure, :impure],
  [:mind, :soul],
  [:less, :more],
  [:civilization, :nature],
  [:old, :new],
  [:them, [:us, :we]],
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
      [:accept, :open, :nourish, :repair, :recharge],
      [:i, :me, :you, :your],
      [:mind, :body, :soul, :end],
      [:strong, :knowledge, :human, :xm, :all],
    ],
  },

  :horseshoe => {
    :desc => "Horseshoe",
    :glyphs => [
      [:past, :present, :now, :equal, :future],
      [:safety, :stability, :stay,],
      [:discover, :potential, :have, :begin, :share],
      [:legacy],
    ],
  },

  :hook => {
    :desc => "Hook",
    :glyphs => [
      [:save, :weak, :answer, :fear, :courage],
      [:danger, :question, :escape, :help, :intelligence],
      [:capture, :liberate, :lead],
    ],
  },

  :em => {
    :desc => "M-shaped",
    :glyphs => [
      [:again, :repeat, :avoid],
    ],
  },

  :en => {
    :desc => "N-shaped",
    :glyphs => [
      [:data, :message, :rebel],
      [:change, :complex, :pursue, :want],
      [:evolution, :progress, :success, :failure, :follow],
    ],
  },

  :vee => {
    :desc => "V-shaped",
    :glyphs => [
      [:attack, :war, :defend],
      [:live, :breathe, :die, :self, :individual],
      [:more, :less, :old, :new, :inside, :not],
      [:grow, :reduce, :contract],
      [:distance, :outside, :path, :barrier, :easy],
      [:deteriorate, :improve, :react, :use],
      [:abandon, :restraint, :them, :us, :we],
    ],
  },

  :wand => {
    :desc => "Wand",
    :glyphs => [
      [:balance, :perfection, :harm,],
      [:impure, :pure, :imperfect, :together,],
      [:nzeer,],
    ],
  },

  :spiral => {
    :desc => "Spiral",
    :glyphs => [[:search, :contemplate, :enlightened, :enlightenment, :unbounded]],
  },

  :bowtie => {
    :desc => "Bowtie",
    :glyphs => [
      [:truth, :lie, :peace, :harmony],
      [:portal, :creativity, :idea, :thought]
    ],
  },

  :complex => {
    :desc => "Complex",
    :glyphs => [
      [:chaos, :journey, :hide, :legacy,],
      [:shapers, :civilization, :nature, :conflict,],
      [:difficult, :intelligence, :technology,],
      [:nzeer, :perspective,],
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
  2 => [:advance, :clear, :distance, :grow, :inside, :less, :more, :new, :old, :reduce, :retreat, :self, :them, :use],
  3 => [:answer, :barrier, :begin, :body, :change, :complex, :courage, :danger, :deteriorate, :discover,
        :easy, :equal, :failure, :fear, :follow, :future, :have, :i, :improve, :open, :past, :path,
        :present, :pursue, :question, :safety, :save, :stay, :success, :want, :weak, :you],
  4 => [:attack, :avoid, :create, :data, :defend, :destroy, :die, :difficult, :escape,
        :help, :hide, :impure, :knowledge, :lead, :live, :message, :mind, :nourish,
        :potential, :pure, :react, :repair, :search, :share, :soul, :strong],
  5 => [:abandon, :again, :capture, :civilization, :conflict, :destiny, :end, :human,
        :liberate, :lie, :nature, :rebel, :resistance, :restraint, :together, :xm],
  6 => [:all, :harm, :journey, :nzeer, :separate, :shapers, :truth],
  7 => [:chaos, :contemplate, :enlightened, :enlightenment, :perfection],
  8 => [:"clear-all", :idea, :legacy, :peace, :perspective, :portal],
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

SINGLETONS = [
  :creativity,
  :contract,
  :i,
  :me,
  :individual,
  :recharge,
  :reduce,
  :share,
  :them,
  :we,
  :you,
  :your,
]

UNSEEN = [
  :contract,
  :i,
  :me,
  :them,
  :we,
  :you,
  :your,
]

DISPLAY_NAMES = {
 :nzeer => "N'Zeer", 
}
