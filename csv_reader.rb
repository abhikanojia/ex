# require 'csv'
# designation_group = Hash.new([])

# CSV.foreach("employees.csv", headers: true) do |row|
#   designation_group[row[2].strip] += [row[0].strip+"(EmpId:"+row[1]+")"]
# end

# File.open("test.txt","w") do |file|
#   designation_group.each do |key, _|
#     file.puts "#{key}"
#     designation_group[key].each do |val|
#       file.puts val
#     end
#     file.print "\n"
#   end
# end

class String
  def pluralize

  end
end

class Hash
  def pluralize_key
    each do |key, value|
      new_key = key + "s"
    end
  end
end

class FileReadWrite
  attr_reader :filename, :out_file

  def initialize(filename, out_file)
    @filename = filename
    @out_file = out_file
    @designation_group = Hash.new([])
  end

  def process
    read_file
    write_file
  end

  private

  def read_file
    require 'csv'
    CSV.foreach(@filename, headers: true) do |row|
      @designation_group[row[2].strip] += [row[0].strip+"(EmpId:"+row[1]+")"]
    end
  end

  def write_file
    @designation_group = @designation_group.sort.to_h
    File.open(@out_file,"w") do |file|
      @designation_group.each do |key, _|
        file.puts "#{key}"
        @designation_group[key].each do |val|
          file.puts val
        end
        file.print "\n"
      end
    end
  end
end

# file = FileReadWrite.new("employees.csv","text.txt")
# file.process
h = {"test"=>[1,2,3], "another"=>[1]}
print h.pluralize_key