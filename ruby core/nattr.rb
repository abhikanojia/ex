module Accessor
  def my_attr_accessor(*attribute)
    attribute.each do |attr|
      ins_var = "@#{attr}"
      define_method(attr) do
        instance_variable_get ins_var
      end

      define_method("#{attr}=") do |val|
        instance_variable_set ins_var, val
      end
    end
  end
end

class Product
  extend Accessor
  my_attr_accessor :name, :price
  def initialize(name, price)
    @name = name
    @price = price
  end
end

ob = Product.new("choco", 191)
p ob.price
p ob.price = 200
