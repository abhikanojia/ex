module MyMod
  def test
    puts "modules method"
  end
end

class A
  include MyMod
  class << self
    # include MyMod
  end
end

# p A.test
p A.singleton_methods
p A.instance_methods