class Movie
  @@movies_list = []
  def initialize(name, year)
    @name = name
    @year = year
  end

  def self.all
    @@movies_list
  end

  def self.blockbuster_all
    @@movies_list.select { |i| i.is_blockbuster? }
  end

  def asssign_random_movie_type
    rand(0..1)
  end

  def blockbuster?
    @blockbuster ||= asssign_random_movie_type
  end
end

class Bollywood < Movie
  def self.all

  end
end
