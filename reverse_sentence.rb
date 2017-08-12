# Public- method for reversing sentence
class String
  def reverse_sentence
    split.reverse.join(' ')
  end
end

if ARGV[0].nil?
  print 'Please provide an input'
  exit
else
  print "\"" + ARGV[0].reverse_sentence + "\""
end
