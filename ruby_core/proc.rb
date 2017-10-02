l = Proc.new { |a,b,c| p a,b,c }
l.call(1, 3)

lam = lambda { |a,b,*c| p a,b,c  }

lam.call(1,2)