module Persistable
  def self.prepended(klass)
    puts "#{self} get prepended in #{klass}"
  end
end

class B
  prepend Persistable
end
