module A
  module InstanceMethods
    def inherited(klass)
      # p self
      puts "#{self} included in Class #{klass}"
    end

    def method
      puts "method"
    end
  end

  def self.extended(klass)
    puts "#{self} is extended in #{klass}"
    klass.include InstanceMethods
  end
end

class Klass
  extend A
end

ob = Klass.new
ob.method