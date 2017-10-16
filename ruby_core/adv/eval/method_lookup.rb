class A
  def instance_method
    p "instance_method"
  end

  def self.class_method
    p "Class method"
  end
  p self
  class << self
    def singleton_method
      p "singleton_method"
    end

    # class << self
    #   def class_class_method
    #     p "Eigen class_class_method"
    #   end
    # end
  end
end

ob = A.new
p "methods"
p A.methods(false)
p A.singleton_class.instance_methods(false)
p A.singleton_class.singleton_class.instance_methods(false)