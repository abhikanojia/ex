# Public: Method for converting case in given string.
# All methods should be called on the String object.
#
# string  - The String to be used for changing case
#
# Examples
#
#   "String".to_s
#   # => sTRING
class String
  def lower?
    !self[/[[:upper:]]/]
  end

  def to_s
    each_char do |x|
      if x.lower?
        print x.upcase
      else
        print x.downcase
      end
    end
  end
end

if ARGV.empty?
  print 'Please provide an input'
else
  ARGV.join(' ').to_s
end
