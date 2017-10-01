require 'csv'

class DynamicClassGenerator
  def initialize(filename, headers)
    @class_name = Class.new { const_set(filename, self) }
    @headers = headers
  end

  private
  def define_class
    @class_name.class_eval do
    end
  end
end


class CSVReader
  def initialize(csv_filename)
    @csv_filename = csv_filename
  end

  def read_headers
    data = CSV.read(@csv_filename, headers: true)
    data.headers
  end
end

#
class ReadDirectory
  def initialize(dir_link)
    @csv_files = []
    @dir_link = dir_link
    read_files
  end

  def csv_files
    @csv_files
  end

  private

  def read_files
    Dir.foreach(@dir_link) do |filename|
      next if filename == '.' || filename == '..'
      @csv_files.push(filename) if File.extname(filename) == '.csv' && File.readable?(filename)
    end
  end
end


object = ReadDirectory.new('.')
object.csv_files.each do |filename|
  csv = CSVReader.new(filename)
  p csv.read_headers
end