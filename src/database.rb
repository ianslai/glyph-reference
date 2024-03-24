
# Correspondences for glyphs that have the same shape
HOMOGRAPHS = [
  [:accept, :open],
  [:balance, :perfection],
  [:breathe, :live],
  [:collective, :shapers],
  [:die, :death],
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
  [:before, :after],
  [:peace, :war],
  [:attack, :defend],
  [:advance, :retreat],
  [:question, :answer],
  [:path, :barrier],
  [:live, :die],
  [:capture, :liberate],
  [:collective, :self],
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
      [:clear, :advance, :retreat, :create, :destroy, :link],
      [:simple, :see, :gain, :lose, :forget, :ignore],
    ],
  },

  :polygonal => {
    :desc => "Polygonal",
    :glyphs => [
      [:accept, :after, :before, :open, :nourish, :repair, :recharge, :field],
      [:i, :me, :you, :your],
      [:mind, :body, :soul, :end],
      [:strong, :victory, :knowledge, :human, :xm, :all, :shield, :toast],
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
      [:adapt, :save, :weak, :answer, :fear, :courage],
      [:danger, :question, :escape, :help, :intelligence],
      [:capture, :liberate, :lead, :'live-again'],
    ],
  },

  :em => {
    :desc => "M-shaped",
    :glyphs => [
      [:again, :repeat, :avoid, :worth],
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
      [:distance, :outside, :path, :barrier, :destination, :easy],
      [:deteriorate, :improve, :react, :use],
      [:abandon, :restraint, :them, :us, :we],
    ],
  },

  :wand => {
    :desc => "Wand",
    :glyphs => [
      [:balance, :perfection, :harm,],
      [:impure, :pure, :imperfect, :together,],
      [:key, :nzeer,],
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
      [:portal, :creativity, :idea, :thought],
      [:nemesis],
    ],
  },

  :complex => {
    :desc => "Complex",
    :glyphs => [
      [:chaos, :journey, :hide, :legacy,],
      [:shapers, :collective, :civilization, :nature, :conflict,],
      [:interrupt, :mystery,],
      [:consequence, :difficult, :intelligence, :technology,],
      [:nzeer, :perspective, :presence],
      [:separate, :destiny, :resistance, :struggle, ],
      [:star, :osiris,],
    ],
  },

  :compound => {
    :desc => "Compound",
    :glyphs => [[:'clear-all', :'open-all', :interrupt, :'live-again']],
  },
}

SEGMENTS = {
  1 => [:forget, :gain, :ignore, :link, :lose, :see, :simple],
  2 => [:advance, :clear, :distance, :outside, :destination, :grow, :inside, :less, :more, :new, :old, :reduce, :retreat, :self, :them, :use],
  3 => [:adapt, :answer, :barrier, :begin, :body, :change, :complex, :courage, :danger, :deteriorate, :discover,
        :easy, :equal, :failure, :fear, :follow, :future, :have, :i, :improve, :open, :past, :path,
        :present, :pursue, :question, :safety, :save, :stay, :success, :want, :weak, :you],
  4 => [:attack, :avoid, :consequence, :create, :data, :defend, :destroy, :die, :difficult, :escape,
        :help, :hide, :impure, :knowledge, :lead, :live, :message, :mind, :nourish,
        :potential, :pure, :react, :repair, :search, :share, :soul, :strong, :victory, :worth],
  5 => [:abandon, :after, :again, :before, :capture, :civilization, :conflict, :destiny, :end, :field, :human,
        :liberate, :lie, :'live-again', :nature, :rebel, :resistance, :restraint, :together, :xm],
  6 => [:all, :collective, :harm, :journey, :nzeer, :separate, :shapers, :shield, :toast, :truth],
  7 => [:chaos, :contemplate, :enlightened, :enlightenment, :interrupt, :key, :perfection, :presence],
  8 => [:"clear-all", :idea, :legacy, :osiris, :peace, :perspective, :portal],
  9 => [:"open-all"],
  10 => [:nemesis, :star, :unbounded],
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
        :sort_order => "%02d" % num,
      }
    ]
  }
  segments.push [
    :"segments4sortof",
    {
      :desc => "4 segments (sort of)",
      :glyphs => [[:imperfect]],
      :sort_order => "04sortof",
    }
  ]
  Hash[segments.sort_by {|x| x[-1][:sort_order]}]
}.call

SINGLETONS = [
  :contract,
  :i,
  :me,
  :individual,
  :reduce,
  :we,
]

UNSEEN = [
  :i,
  :me,
  :we,
]

DISPLAY_NAMES = {
 :nzeer => "N'Zeer", 
}
