# Public: Counts the occurances of characters in given string.
#
# string  - The String to be used for counting characters
# which is passed as command line argument.
#
# Examples
#
#  ruby occurence_hash.rb string
#  # => {"s"=>1, "t"=>1, "r"=>1, "i"=>1, "n"=>1, "g"=>1}
#
# Returns the hash having characters as their keys
# and their no. of occurences as values
if ARGV.empty?
  print 'Please provide an input'
  exit
else
  # considering multiple arguments as a single string
  string = ARGV.join(' ')
  histo = Hash.new(0)
  string.chars.each { |x| histo[x] += 1 if x.between?('A', 'z') }
  print histo
end