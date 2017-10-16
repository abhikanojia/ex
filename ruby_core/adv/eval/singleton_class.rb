class A
  def method_name
    p "from class"
  end
end

ob = A.new
def ob.method_name
  p "from objects singleton class"
  p self
  # class << self
  #   self
  # end
end

ob.method_name
p ob.singleton_class