# Public: Method for counting number of characters in given string.
# All methods should be called on the OccurenceHash
# class object.
#
# string  - The String to be used for counting characters
# which is passed as command line argument.
#
# Examples
#
#   obj = OccurenceHash.new(string)
#   obj.get_occurence_hash()
#   # => {"s"=>1, "t"=>1, "r"=>1, "i"=>1, "n"=>1, "g"=>1}
class OccurenceHash
  def initialize(string)
    if string.empty?
      print 'Please provide an input'
      exit
    else
      # considering multiple arguments as a single string
      @string = string.join(' ')
    end
  end

  def occurence_hash
    histo = Hash.new(0)
    @string.chars.each { |x| histo[x] += 1 if x.between?('A', 'z') }
    histo
  end
end

obj = OccurenceHash.new(ARGV)
print obj.occurence_hash
