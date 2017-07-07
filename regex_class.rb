# Public: Method for replacing vowels in given string with a '*'.
# All methods should be called on the OccurenceHash class object.
#
# string  - The String to be used for replacing characters
# which is passed as command line argument.
#
# Examples
#
#   obj = RegexClass.new(string)
#   obj.regex_replace
#   # => str*ng
class RegexClass
  def initialize(string)
    if string.empty?
      print 'Please provide an input'
      exit
    else
      # considering multiple arguments as a single string
      @string = string.join(' ')
    end
  end

  def regex_replace
    @string.gsub!(/[aeiou]/, '*')
    print @string
  end
end

obj = RegexClass.new(ARGV)
obj.regex_replace
