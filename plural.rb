class String
  def pluralize
    self << "s"
  end
end

plural = {"Developer"=>"Developers", "Designer"=> "Designers", "Tester" => "Testers"}
h = { "Developer"=> ['jane', 'Doe'], "Designer"=>['mary', 'cristine'], "Tester"=> ["rake"]}

h.map do |key, value|
  [plural[key], value] if h[key].length > 1
end
print h.to_h
