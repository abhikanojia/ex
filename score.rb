class Score
  def initialize
    @total = @count = 0
  end

  def <<(score)
    @total += score
    @count += 1
    self
  end

  def avg
    fail "No score" if @count.zero?
    Float(@total) / @count
  end
end

scores = Score.new
scores << 10 << 20 << 30
puts "average #{scores.avg}"
