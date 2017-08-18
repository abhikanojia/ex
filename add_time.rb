require 'time'
require 'date'
# time class
class Time
  def add(arg)
    @time1 = arg.delete(arg.first)
    @result_time = arg.inject(@t1) do |sum, time|
      sum + time.hour * 3600 + time.min * 60 + time.sec
    end
    print_formatted
  end

  private

  def no_of_days
    @result_time.day - @t1.day
  end

  def print_formatted
    if no_of_days >= 1
      "#{no_of_days} day & #{@result_time.strftime('%H:%M:%S')}"
    else
      "#{@result_time.strftime('%H:%M:%S')}"
    end
  end
end

if ARGV.first.nil?
  print 'Please provide an input'
else
  time_array = []
  begin
    ARGV.each { |time_str| time_array.push(Time.parse(time_str)) }
  rescue ArgumentError
    print "\"Invalid 24-hour time value\""
    exit
  end  
  print "\"#{Time.new.add(time_array)}\""
end