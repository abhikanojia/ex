# Method for returning sorted hash
class Array
  def array_hash
    test = Hash.new([])
    inject(test) do |hash, value|

    end
    #test = Hash.new([])
    # hash.each do |key, value|
    #   if key.odd?
    #     test["odd"] += [value]
    #   else
    #     test["even"] += [value]
    #   end
    # end
    # test
  end
end
# for converting string representation of array to
# array
class String
  def to_array
    require 'json'
    JSON.parse(tr("'", '"'))
  end
end

if ARGV[0].nil?
  print 'Please provide an input'
  exit
else
  array_string = ARGV[0].to_array.map(&:to_s)
  print array_string.array_hash
end
