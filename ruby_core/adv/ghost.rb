class A
  def method_missing(name, *args)
    "called method missing"
  end
  def respond_to_missing?
    "called respond_to_missing"
  end
end

ob = A.new

p ob.respond_to_missing? :test
