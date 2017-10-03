# puts "This is the first line before the fork (pid #{Process.pid})"
# puts fork
# puts "This is the first line after the fork (pid #{Process.pid})"


puts "You can also put forked code in a block pid: #{Process.pid}"
fork do
  puts "Hello from fork pid: #{Process.pid}"
end
puts "The parent process just skips over it: #{Process.pid}"
