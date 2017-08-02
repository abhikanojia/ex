line = gets.chomp
if %W{"yes", "y"}.include?(line)
  print "test"
else
  puts line
end
