l = lambda { |a| a + 1  }
puts l.call(99)

p = Proc.new { |a| a + 1 }
puts p.call(99)

def convert(&blk)
	blk
end

l = convert { |a| a + 1  }
puts l.call(99)
