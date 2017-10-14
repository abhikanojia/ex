p self

local = self
p local
module A;end
class << self
  p self
  class << self
    include A
    p ancestors
  end
end