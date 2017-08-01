# Basic Object function
class KlassWithSecret
  def initialize
    @secret = 99
  end

  private

  def the_secret
    "The secret is this number #{@secret}"
  end
end

k = KlassWithSecret.new

print k.instance_eval { the_secret }
