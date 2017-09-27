class MaxInclusionReached < StandardError; end

module A
  @@count = 0

  def self.append_features(mod)
    raise MaxInclusionReached if @@count. >= 5
  rescue MaxInclusionReached
    puts "Max number of Inclusion reached"
  end

  def self.included(klass)
    @@count += 1 if @@count < 5
  end

  def self.extended(klass)
    @@count += 1 if @@count < 5
  end

  def self.count
    @@count
  end

  def test
    puts "As"
  end
end

class B
  include A
end

p A.count
p B.new.test
p B.ancestors
