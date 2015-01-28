PHRASES_FILE = lambda {
  root_path = File.dirname(File.dirname(__FILE__))
  File.join(File.join(root_path, 'data'), 'phrases.txt')
}.call

PHRASES = File.readlines(PHRASES_FILE).reject {|line| line.strip.empty? }.map do |line|
  line.chomp.downcase.gsub(/[^a-z\- ]/, '').split.map { |x| x.to_sym }
end.sort

PHRASES_REF = PHRASES.inject({}) do |hash, phrase|
  phrase.each do |sym|
    hash[sym] ||= []
    hash[sym].push phrase unless hash[sym].include?(phrase)
  end
  hash
end