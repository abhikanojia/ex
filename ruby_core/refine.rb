# module StringExtension
#   refine String do
#     def alpha
#       upcase
#     end
#   end
# end

# using StringExtension

# p "hi there".alpha

class MyClass
  def my_method
  "original my_method()"
  end

  def another_method
    my_method
  end
end

module MyClassRefinement
  refine MyClass do
    def my_method
      "refined my_method()"
    end
  end
end

class A
  include MyClassRefinement
  def my_method

  end
end

p A.new.my_method


using MyClassRefinement

p MyClass.new.my_method
p MyClass.new.another_method