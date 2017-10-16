# A = 10

module Mod
  A = 23
  module C
    A = 29
    class Test
      A = 20
      module Inner
        A = 299
      end
    end
    module D
      # p B::C::A
      # p ::A
      # p B::C::Test::Inner::A
      p Module.nesting
    end
  end

  def method_name
    p "me"
  end
end

class A
  class B
    module C; end
    include Mod
    p Module.nesting
  end
end

ob = A::B.new
p ob.method_name