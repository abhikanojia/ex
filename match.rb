string = "I have $10 and $20"
# pattern = 

string.gsub!( /\$(\d\d)/ ,'\1 dollars') 

puts string
# string.scan() do |m|
#   str = $`  