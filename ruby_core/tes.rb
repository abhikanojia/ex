def test(a,b,c = 1)
  print a,b,c
end

a = [1,2,3]

Object.public_send(:test, *a)

begin
  test
rescue Exception => e
  puts e.message
end



h = Hash.new([])

method(:test).parameters.each do |x|
  h[x.first] += [x[1]]
end


p method(:test).parameters.group_by { |x| x =~ /req/ }
p h