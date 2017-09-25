module Z
  def self.z ; :z ; end
  def test
    "from module z"
  end
end

class Bar
  def self.bar ; :bar ; end
end

class Foo < Bar
  include Z
end

# p Foo.z

p Foo.bar

p Foo.new.test

Bar.instance_eval do

  def method_name
    ins
  end
  private
  def ins
    "singleton_class method Bar"
  end
end

p Bar.method_name

ob = Bar.new
p ob.singleton_class
# def ob.bar
#   "singleton_class of object"
# end

p ob.bar

p Bar.singleton_class.instance_methods(false)
