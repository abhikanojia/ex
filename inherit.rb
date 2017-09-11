class A
	private
	
	def pvt
	 puts "private from A"
	end
	
	protected
		
	def test 
		puts "test"
	end
end

class B < A
	def another
	 test
	end
	
	def pvt_test
		pvt
	end
end

b = B.new

b.another	
b.pvt_test
