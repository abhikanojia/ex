# Including CSV library
require 'csv'
# Public - Method process for processing input file
class String
  def process
    @designation_group = Hash.new([])
    @new_hash = Hash.new([])
    CSV.foreach(self, headers: true) do |row|
      @designation_group[row[2].strip] += [row[0].strip + "(EmpId: #{row[1]})"]
    end
    create_hash_group
  end

  def pluralize
    self << 's'
  end

  private

  def create_hash_group
    @designation_group = @designation_group.sort.to_h
    @designation_group.each do |key, value|
      designation = key.dup
      designation.pluralize if value.length > 1
      @new_hash[designation] = value
    end
    write_in_another_format
  end

  def write_in_another_format
    File.open('employees.txt', 'w+') do |file|
      @new_hash.each do |key, _|
        file.puts key.to_s
        @new_hash[key].each do |val|
          file.puts val
        end
        file.puts
      end
    end
  end
end

puts 'Processing....'
'employees.csv'.process
print 'File is ready to be used'
