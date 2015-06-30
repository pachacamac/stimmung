output = File.open('./lib/german.txt', 'w')

#http://wortschatz.informatik.uni-leipzig.de/download/
lines = File.readlines('SentiWS_v1.8b_Negative.txt') + File.readlines('SentiWS_v1.8b_Positive.txt')
lines.each do |line|
  w,_,s,mw = line.chomp.split(/\s|\|/)
  w = [w]
  w += mw.split(',') if mw
  w.each do |word|
    output.puts "#{s}\t#{word.downcase}"
  end
end

output.close
