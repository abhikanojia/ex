class Demo
  def initialize(n)
    @secret = n
  end

  def get_binding
    binding
  end
end

ob = Demo.new(11)
print ob.get_binding