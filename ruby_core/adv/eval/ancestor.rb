module A; end
module D; end

class B
  prepend A
  prepend D
end

class C < B
  prepend A
end

class E < C
  include D
  include A
end

# E, C, D, A, B
p E.ancestors
# A, E, C, D, B, Object, Kernel, basicObj
# p E.singleton_class.ancestors

# [E, D, C, A, B, A, Object, Kernel, BasicObject]

# module A
#   def method_name
#     "method_name"
#   end
# end

# class D
#   include A
# end

# class B < D
#   prepend A
# end

# p B.ancestors
# p B.singleton_class.ancestors

