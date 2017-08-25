require 'time'
# time class
class Time
  HOUR_CONVERSION = 3600
  MIN_CONVERSION = 60
  TIME_FORMAT = '%H:%M:%S'.freeze
  def add(time_array)
    time_first = time_array.delete(time_array.first)
    time_array.inject(time_first) do |sum, time|
      sum + time.hour * HOUR_CONVERSION + time.min * MIN_CONVERSION + time.sec
    end
  end

  def diff_in_no_of_days
    day - Time.now.day
  end

  def self.print_formatted(time, no_of_extra_days)
    time = "\"#{time.strftime(TIME_FORMAT)}\""
    no_of_extra_days >= 1 ? "\"#{no_of_extra_days} day & #{time}\"" : time
  end
end

if ARGV.first.nil?
  print 'Please provide an input'
else
  time_array = []
  begin
    ARGV.each { |time_str| time_array.push(Time.parse(time_str)) }    
    result_time = Time.new.add(time_array)    
    no_of_extra_days = result_time.diff_in_no_of_days
    print Time.print_formatted(result_time, no_of_extra_days)
  rescue ArgumentError
    print "\"Invalid 24-hour time value\""
    exit
  end
end