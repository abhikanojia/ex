class Klass
  def hello(*args)
    "Hello " + args.join(' ')
  end
end
k = Klass.new
print k.__send__ :hello, "gentle", "readers"
