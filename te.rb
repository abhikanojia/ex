class String
  def process
    open_file
  end

  def open_file
    File.open("employees.txt", "w+") do |file|
       file.puts "done"
       puts "done"
    end
  end
end

"employees.txt".process
