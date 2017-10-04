class A
  def initialize
    
  end

  def test_method
    "test method : not in singleton class"
  end

	class << self
		def test_method
			"test from singleton class"
		end
    class << self
      def test_method
        "method from singleton class's singleton class"
      end
    end
  end
end

p A.singleton_class.test_method