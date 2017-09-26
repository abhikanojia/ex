class Demo
  def initialize(n)
    @secret = n
  end

  def get_binding
    binding
  end
end

ob = Demo.new(11)
p eval "@secret", ob.get_binding
