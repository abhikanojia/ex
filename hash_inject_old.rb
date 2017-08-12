# including json
require 'json'
# for converting string representation of array to
# array
class Array
  def array_hash
    hash = Hash.new([])
    each { |x| hash[x.length] += [x] }
    h = hash.to_h
    output = Hash.new([])
    h.inject(output) do |_, value|
      if value[0].odd?
        output['odd'] += [value[1]]
      else
        output['even'] = [value[1]]
      end
    end
    output
  end
end
# class for coverting string to array
class String
  def to_array
    JSON.parse(tr('\'', '"'))
  end
end

if ARGV[0].nil?
  print 'Please provide an input'
  exit
else
  array_string = ARGV[0].to_array.map(&:to_s)
  print array_string.array_hash
end
