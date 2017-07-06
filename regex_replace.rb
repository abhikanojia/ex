# Public: Replaces the vowels in given string with a '*'.
#
# line  - This is the string provided as input to the program.
#
# Examples
#
#  ruby regex_replace.rb
#  # => Please provide an input
#  # => Hello world
#  # => H*ll* w*rld
#
# Returns the modified input having vowels replaced with '*'
puts "Please enter a text"

line = gets.chomp

if line.empty?
  print "Please provide an input"
  exit
else
  pattern = /[aieou]/
  line.gsub!(pattern, '*')
  print line
end