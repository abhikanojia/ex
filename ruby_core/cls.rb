class CleanRoom
  def curr_temp
     @v = 1
  end
end

clean_room = CleanRoom.new

clean_room.instance_eval do
  p self
  if curr_temp > 0
    puts "greater than 0"
  end
  def method_name
    p "asdasd"
  end
end

clean_room.method_name

t = CleanRoom.new
# t.method_name