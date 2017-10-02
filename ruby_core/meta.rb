class Example
	# def one
	# 	@value ||= 99 # expensive
	# end
	def start
		p "start"
		def stop
			p "stop"
		end
	end
end

ob = Example.new
ob.start
ob.stop
