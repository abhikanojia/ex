class Array
  def find
    each do |x|
      return x if yield(x)
    end
    nil
  end
end

p [1,2,3,4].find { |val| val > 2 }
