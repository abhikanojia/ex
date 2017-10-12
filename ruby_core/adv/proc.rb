# # x = 'hi'
# # y = 'there'

# # pr = Proc.new do |a|
# #   a
# # end

# # class A
# #   def initialize(pr)
# #     p pr.call(self)
# #   end
# # end

# # ob = A.new(pr)

# x = 2
# pr = proc{ |x| p x }

# h = { me: 'sleepy' }

# h.instance_eval do
#   z = 4
#   p pr.call z
# end

# pr.call 1

# pr = proc { |x|
#   def method(x)
#     p x
#   end
# }
# pr.call
# send(:method, 1)

# module Cat
#   def meth
#     "Cat#meth"
#   end
# end

# Q
# class A
#   extend Cat
#   include Cat
# end

# p A.ancestors
# p A.methods.grep /meth/
# p A.new.meth
# p A.meth

module Cat; end
module M; end
class Feline
  extend Cat
  class << self
    include M
  end
end

p Feline.singleton_class.ancestors