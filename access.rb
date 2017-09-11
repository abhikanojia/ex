class A

  def hi
   puts "asd"
  end

  private

  def method_name
    puts "private"  
  end
end

class B < A
  def test
    method_name
  end
end

ob = A.new
ob.public_method(:hi).call

