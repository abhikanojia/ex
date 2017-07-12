square = "some shape"
sum = 0
[1, 2, 3, 4].each do |value, square|
square = value * value # this is a different variable
sum += square
end
puts sum
puts square
