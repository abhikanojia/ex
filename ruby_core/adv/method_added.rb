module TraceCalls
  def self.included(klass)
    def klass.method_added(name)
      return if @_adding_a_method
      @_adding_a_method = true
      original_method = "original #{name}"
      alias_method original_method, name
      define_method(name) do |*args, &block|
        puts "==> Calling #{name} with #{args.inspect}"
        result = send original_method, *args, &block
        puts "<== result = #{result}"
      end
      @_adding_a_method = false
    end
  end
end

class Example
  include TraceCalls

  def some_method(arg1, arg2)
    arg1 + arg2
  end

  def method2(arg)
    yield * arg
  end
end

object = Example.new

object.some_method(5, 4)
object.method2(2) { 3 }
p Example.instance_methods(false)
