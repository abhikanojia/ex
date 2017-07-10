# Public: Method for whether given string is palindrome.
# All methods should be called on the String object.
#
# string  - The String to be used for checking palindrome
#
# Examples
#
#   "string".palindrome?
#   # => Input string is not palindrome
class String
  def palindrome?
    string = self
    return true unless string != string.reverse
  end
end

if ARGV.empty?
  print 'Please provide an input'
  exit
elsif ARGV.join(' ').palindrome?
  print 'Input string is a palindrome'
else
  print 'Input string is not a palindrome'
end
