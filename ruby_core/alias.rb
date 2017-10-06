module MyAccessor
  def my_att_accessor(*attribute)
    attribute.each do |att|
      inst_var = "@#{att}"
      define_method(att) do
        instance_variable_get inst_var
      end

      define_method("#{att}=") do |val|
        instance_variable_set inst_var, val
      end
    end
  end
end


class A
  extend MyAccessor

  my_att_accessor :a
end

ob = A.new
ob.a = 10
p ob.a