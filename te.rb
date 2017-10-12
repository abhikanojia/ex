module D
  def method_name
    # p self.class.give_count
    @@count
  end
  module E
    def give_count
      p @@count
    end
    class_eval do
      @@count = 1
    end
  end

  def self.included(klass)
    klass.extend(E)
  end
end

class A

  include D
end

p A.new.method_name