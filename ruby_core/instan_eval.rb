class Thing
  def initialize
    @var = 123
  end

  private

  def secret
    "RUby is lou"
  end
end



t = Thing.new
p t

p t.instance_eval("@var")
t.instance_eval { @var = "cat" }

p t.instance_eval {secret}
