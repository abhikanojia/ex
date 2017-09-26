  def test
    lambda { "Asdasd" }
  end

ob = test
p send(&ob)
