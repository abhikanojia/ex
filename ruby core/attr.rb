module Accessor
  def my_attr_accessor(*names)
    names.each do |name|
    ivar_name = "@#{name}"

    define_method(name) do
      instance_variable_get(ivar_name)
    end

    define_method("#{name}=") do |val|
      instance_variable_set(ivar_name, val)
    end
  end
end
end
class Example
  extend Accessor
  my_attr_accessor :var , :var2
end

ex = Example.new
ex.var = 99
p ex.var
