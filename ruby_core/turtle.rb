class Turtle
  attr_reader :path
  def initialize
    @path = []
  end

  def up(n=1)
    @path << "u" * n
  end

  def down(n=1)
    @path << "d" * n
  end

  def right(n=1)
    @path << "r" * n
  end

  def move(&block)
    instance_eval(&block)
  end
end

t = Turtle.new

t.move do
  p self
  up(2)
  right(2)
  down(2)
end

p t.path.join