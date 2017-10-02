# Read CSV and returns headers
class CSVReader
  def initialize(csv_filename)
    @csv_filename = csv_filename
  end

  def read_headers
    data = CSV.read(@csv_filename, headers: true)
    data.headers
  end

  def collect_rows_object(rows)
    CSV.foreach(@csv_filename) { |row| rows << row }
  end
end