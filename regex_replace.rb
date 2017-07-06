# Public: Replaces the vowels in given string with a '*'.
#
# string  - This is the string provided as input to the program.
#
# Examples
#
#  ruby regex_replace.rb
#  # => Please provide an input
#  # => Hello world
#  # => H*ll* w*rld
#
# Prints the modified input having vowels replaced with '*'
if ARGV.empty?
  print 'Please provide an input'
  exit
else
  pattern = /[aieou]/
  string = ARGV.join(' ')
  string.gsub!(pattern, '*')
  print string
end