class A
  def instance_method
    p "instance_method"
  end

  # def method_name
  #   p "class instance_method"
  # end

  def self.class_method
    p "Class method"
  end
  p self
  class << self
    def singleton_method
      p "singleton_method"
    end

    # def method_name
    #   p "from singleton_class"
    # end

    class << self
      def class_class_method
        p "Eigen class_class_method"
        self
      end

      def method_name
        p "from singleton_class's singleton_class"
      end
    end
  end
end

ob = A.new
# ob.method_name
# p "methods"
A.method_name
# p A.methods(false)
# # p A.singleton_class.instance_methods(false)
# p A.singleton_class.methods(false)
# p A.singleton_class.singleton_class.instance_methods(false)

# p A.singleton_class.class_class_method