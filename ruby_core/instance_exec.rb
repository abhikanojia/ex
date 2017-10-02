class KlassWithSecret
  def initialize
   @secret = 99
  end
end

k = KlassWithSecret.new

k.instance_exec(10) { |x|  print @secret + x }
