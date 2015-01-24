
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

# Detailed descriptions for glyphs that have them
DESCRIPTIONS = {
  :not => "Derived from the symbol for the \"not\" operator from Boolean algebra (&not;).",
}

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