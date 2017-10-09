class A
  @@test =""
  def tst
    self.class.class_variable_set("@@test", 12)
  end

  def self.test
    @@test
  end
end

p A.new.tst