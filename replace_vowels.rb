# Public: Method for replacing vowels in given string with a '*'.
# All methods should be called on the String object.
#
# symbol  - The Symbol to be used for replacing characters
#
# Examples
#
#   "string".replace_vowels('*')
#   # => str*ng
class String
  def replace_vowels(symbol)
    gsub!(/(?i)[aeiou]/, symbol)
  end
end

if ARGV.join(' ').empty?
  print 'Please provide an input'
  exit
else
  print ARGV.join(' ').replace_vowels('*')
end
