# module Accessor
#   def my_attr_accessor(name)
#     ivar = "@#{name}"

#     define_method("#{name}") do
#       instance_variable_get(ivar)
#     end

#     define_method("#{name}=") do |val|
#       instance_variable_set(ivar, val)
#     end
#   end
# end

module Accessor
  def my_attr_accessor(name)
    class_eval %{
      def #{name}
        @#{name}
      end

      def #{name}=(val)
        @#{name} = val
      end
    }
  end
end



class A
  extend Accessor
  my_attr_accessor :var
end

m = A.new
m.var = "cat"
puts m.var