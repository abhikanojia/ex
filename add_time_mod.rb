require 'time'
# time class
class Time
  HOUR_CONVERSION = 3600
  MIN_CONVERSION = 60
  TIME_FORMAT = '%H:%M:%S'.freeze

  def add(time_a, time_b)
    time_a + time_b.hour * HOUR_CONVERSION + time_b.min * MIN_CONVERSION + time_b.sec
  end

  def diff_in_no_of_days
    day - Time.now.day
  end

  def self.print_formatted(time)
    no_of_extra_days = time.diff_in_no_of_days
    time_str = time.strftime(TIME_FORMAT)
    no_of_extra_days >= 1 ? "#{no_of_extra_days} day & #{time_str}" : time_str
  end
end

if ARGV.first.nil?
  print 'Please provide an input'
else
  begin
    time_a = Time.parse(ARGV.first)
    time_b = Time.parse(ARGV[1])
    result_time = Time.new.add(time_a, time_b)
    print "\"#{Time.print_formatted(result_time)}\""
  rescue ArgumentError
    print "\"Invalid 24-hour time value\""
    exit
  end
end