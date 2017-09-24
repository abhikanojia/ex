class Computer
  @@count = 0
  def initialize
    @sound = "ruff"
  end

  def self.about
    p "i have access to #{@sound}"
    p "i have access to #{@@count}"
  end
end

Computer.about
