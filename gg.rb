# for converting string representation of array to
# array
class Array
  def array_hash
    hash = Hash.new([])
    each { |x| hash[x.length] += [x] }
    h = hash.to_h
    art = Hash.new([])
    h.inject(art) do |_, value|
      if value[0].odd?
        art["odd"] += [value[1]]
      else
        art["even"] = [value[1]]
      end
    end
    art
  end
end

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
