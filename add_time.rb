require 'time'
# time class
class Time
  def add(time_array)
    time_first = time_array.delete(time_array.first)
    time_array.inject(time_first) do |sum, time|
      sum + time.hour * 3600 + time.min * 60 + time.sec
    end
  end

  def diff_in_no_of_days
    self.day - Time.now.day
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
    
    if no_of_extra_days >= 1
      print "\"#{no_of_extra_days} day & #{result_time.strftime('%H:%M:%S')}\""
    else
      print "\"#{result_time.strftime('%H:%M:%S')}\""
    end

  rescue ArgumentError
    print "\"Invalid 24-hour time value\""
    exit
  end
end