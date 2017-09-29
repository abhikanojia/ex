class Parent
  def initialize(name, age)

  end

  def test(a)

  end
end

class Child < Parent
  def test(a)
    super
  end
end

child = Child.new
