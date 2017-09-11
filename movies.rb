class Movie

  @@movies_list = []

  def initialize(name, year)
    @name = name
    @year = year.to_i
    @@movies_list.push(self)
  end

  def asssign_random_movie_type
    rand(0..1) # 1 blockbuster
  end

  def self.blockbuster_all
    @@movies_list.select {|x| x.blockbuster? }
  end

  def blockbuster?
    @blockbuster ||= asssign_random_movie_type
  end

  def self.all
    @@movies_list.select { |x| x if x.blockbuster? }    
  end

  def self.count
    @@movies_list.count
  end
end



# Hollywood class
class Hollywood < Movie 
  def self.all
    @@movies_list.select { |x| x.class.to_s.eql? "Hollywood" }
  end

  def blockbuster?
    super
  end
end


# Bollywood class
class Bollywood < Movie
  
  def self.all
    @@movies_list.select { |x| x.class.to_s.eql? "Bollywood" }
  end

  def blockbuster?
    super
  end

  def bollywood?
    self.class.to_s.eql? "Bollywood"
  end
end


a = Bollywood.new("AB", 1992)
b = Hollywood.new("Avenger", 2001)
c = Hollywood.new("Deadpool", 2016)

# check b is blockbuster
puts b.blockbuster?
puts b.blockbuster?
puts b.blockbuster?
puts b.blockbuster?

puts b.blockbuster?
puts b.blockbuster?
puts b.blockbuster?

puts "-" * 10

# print all hollywood
p Hollywood.all 

puts "-" * 10

# print all bollywood
p Bollywood.all 


puts "-" * 10
p Movie.blockbuster_all

p Movie.blockbuster_all

puts "Count: #{Movie.count}"