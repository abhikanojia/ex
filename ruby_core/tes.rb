# def test(a,b,c = 1)
#   print a,b,c
# end

# a = [1,2,3]

# Object.public_send(:test, *a)

# begin
#   test
# rescue Exception => e
#   puts e.message
# end



# h = Hash.new([])

# method(:test).parameters.each do |x|
#   h[x.first] += [x[1]]
# end


# p method(:test).parameters.group_by { |x| x =~ /req/ }
# p h
# a = binding

# string = "a=1\n"

# eval string

# eval "p a"

# class A
#   def test
#     p self.class
#     def another
#       self.class
#     end
#   end
# end

# p A.new.test
# p A.new.another


# class A
# end

# ob = A.new
# class << ob
#   def  meth
#     self.class
#   end
# end

# p ob.singleton_class.instance_methods(false)

# MyClass = Class.new(Array) do
#   def my_method
#     'Hello!'
#   end
# end

# p MyClass.new.my_method


class A
  def test
    p "test from #{self}"
  end
end

class B < A; end

ob = B.new

class << ob
  def te
    puts "Asd"
  end
end

ob.test