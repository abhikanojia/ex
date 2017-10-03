# class A
#   def self.test
#      puts "Self method"
#      self.new.error_occured
#   end
#
#   def error_occured
#     puts "error"
#   end
# end
#
# A.test

eval %q{
  def method
    print "asdasd"
  end
}

a = ["def method", "print 'asdasd'","print 'another'", "end"]

eval %{
  a.join(';')
}

method
