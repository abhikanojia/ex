# ReadDirectory class for reading csv files from current directory
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