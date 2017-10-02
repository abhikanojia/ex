class Greeting
  def initialize(text)
    @text = text
  end

  def welcome
    @text
  end
end

obj = Greeting.new("Hi there")
p obj.class.instance_methods(false)
p obj.instance_variables