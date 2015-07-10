class Stimmung
  attr_accessor :words

  def initialize(*dicts)
    @words = Hash.new(0.0)
    if dicts.empty?
      load_dictionary(File.join(File.dirname(__FILE__), 'emoticons.txt'), File.join(File.dirname(__FILE__), 'german.txt'))
    else
      load_dictionary(*dicts)
    end
  end

  def score(str)
    str.to_s.downcase.split(/[\s\!\?\.]+/).reduce(0.0){|s,e| s += @words[e] }
  end

  def load_dictionary(*files)
    files.each do |file|
      File.readlines(file).each do |line|
        score, text = line.chomp.split(/\s/)
        @words[text] = score.to_f
      end
    end
  end
end
