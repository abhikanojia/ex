# class Module
#   def const_missing(name)
#     puts "#{name} missing"
#   end
# end
#
# Test
# A

class Dave
  def self.const_missing(name)
    # puts "Missing #{name} in Dave"
    # super
  end
end

Dave::Fred
