module A
  def method_name
    p "Asda"
  end
end

class B
  def test
    "asd"
  end
end

a = A.new
p a.method :method_name
p B.instance_method :test