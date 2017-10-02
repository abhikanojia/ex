module Hello
  def say_hello
    puts "Hi from #{self.inspect}"
  end
end

[String, Array, Hash].each do |cls|
  cls.class_eval { include Hello }
end

"cat".say_hello
[].say_hello
{}.say_hello