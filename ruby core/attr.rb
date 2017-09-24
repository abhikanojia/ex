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

# module Accessor
#   def my_attr_accessor(*names)
#     names.each do |name|
#     ivar_name = "@#{name}"

#     define_method(name) do
#       instance_variable_get(ivar_name)
#     end

#     define_method("#{name}=") do |val|
#       instance_variable_set(ivar_name, val)
#     end
#   end
# end
# end
# class Example
#   extend Accessor
#   my_attr_accessor :var , :var2
# end

# ex = Example.new
# ex.var = 99
# p ex.var

