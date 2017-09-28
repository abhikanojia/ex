class A
  def self.test
     puts "Self method"
     self.new.error_occured
  end

  def error_occured
    puts "error"
  end
end

A.test
