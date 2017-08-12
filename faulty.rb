regex = /4.*/
num = 0
for i in 1..1000
  next if regex.match?(i.to_s)
  num += 1
end

print num
