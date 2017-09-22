# class ApplicationConfiguration
#   @@configuration = {}
#
#   def self.set(property, value)
#     @@configuration[property] = value
#   end
#
#   def self.get(property)
#     @@configuration[property]
#   end
# end
#
# class ERPApplicationConfiguration < ApplicationConfiguration
# end
#
# class WebApplicationConfiguration < ApplicationConfiguration
# end
#
# ERPApplicationConfiguration.set("name", "ERP Application")
# WebApplicationConfiguration.set("name", "Web Application")
#
# p ERPApplicationConfiguration.get("name")
# p WebApplicationConfiguration.get("name")
#
# p ApplicationConfiguration.get("name")

# class Foo
#   @count = 0
#
#   def self.inc
#     @count += 1
#   end
#
#   def self.curr
#     @count
#   end
# end
#
# class Bar < Foo
#   @count = 100
# end
#
# Foo.inc
# Bar.inc
# p Foo.curr
# p Bar.curr


# FIX USING CLASS INSTANCE VARIABLE

class ApplicationConfiguration
  @configuration = {}
  @count = 1
  def self.set(property, value)
    #self.class.configuration[property] = value
    self.class.count += 1
  end

  def self.get(property)
    self.class.configuration[property]
  end
end

class ERPApplicationConfiguration < ApplicationConfiguration
  @configuration = {}
end

class WebApplicationConfiguration < ApplicationConfiguration
end

ERPApplicationConfiguration.set("name", "ERP Application")
# WebApplicationConfiguration.set("name", "Web Application")

p ERPApplicationConfiguration.get("name")
p ERPApplicationConfiguration.count

# p ERPApplicationConfiguration.methods(false)
#p WebApplicationConfiguration.get("name")

# p ApplicationConfiguration.get("name")
