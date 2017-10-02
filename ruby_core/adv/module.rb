module A
  def foo; end
  def bar; end
end

module B
  def hello; end
  def bye; end
end

module C
  include B
  def start; end
  def start; "second";end
end

module D
  include A
  include C
end

class At
  include D
end

p At.new.method(:foo)

p D.ancestors

p D.instance_methods

p D.instance_method(:foo)
