# class Module
#   def const_missing(name)
#     puts "#{name} missing"
#   end
# end
#
# Test
# A

# class Dave
#   def self.const_missing(name)
#     # puts "Missing #{name} in Dave"
#     # super
#   end
# end
#
# Dave::Fred


class Color
  def self.const_missing(name)
    const_set(name, new)
  end
end

puts Color::Red
puts Color::Orange

puts Color::Red == Color::Orange
puts Color::Orange == Color::Orange
