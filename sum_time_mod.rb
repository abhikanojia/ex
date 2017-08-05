# Public -Method sum_time for
# adding time given
class Time
  def initialize
    @total_days, @total_hours, @total_minutes, @total_seconds = 0, 0, 0, 0
  end

  def sum_time(time_arr)
    time_arr.each do |time|
      return 'Invalid 24-hour time value' if validate(time).nil?
      hours, minutes, seconds = time.split(':')
      @total_seconds += seconds.to_i
      @total_minutes += minutes.to_i
      @total_hours   += hours.to_i
      extra_time
    end
    if @total_days.zero?
      [(@total_hours % 24).to_s, @total_minutes.to_s, @total_seconds.to_s]
    else
      [@total_days.to_s, (@total_hours % 24).to_s, @total_minutes.to_s, @total_seconds.to_s]
    end
  end

  private

  def validate(time)
    pattern = /(^[0|1]?[0-9]|2[0-3]):[0-5]?[0-9]:[0-5]?[0-9]/
    true if pattern.match(time)
  end

  def extra_time
    extra_minutes, @total_seconds = @total_seconds.divmod(60)
    @total_minutes += extra_minutes
    extra_hours, @total_minutes = @total_minutes.divmod(60)
    @total_hours += extra_hours
    @total_days = @total_hours / 24
  end
end

if ARGV.empty?
  print 'Please provide an input'
else
  object = Time.new
  time = object.sum_time(ARGV)
  if time.length.eql? 4
    print '"' + format('%01d day & %02d:%02d:%02d', time[0], time[1], time[2], time[3]) + '"'
  elsif time.length.eql? 3
    print '"' + format("%02d:%02d:%02d", time[0], time[1], time[2]) + '"'
  else
    print "\"#{time}\""
  end
end
