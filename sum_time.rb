# Public -Method sum_time for
# adding time given
class Time
  def initialize
    @total_hours, @total_minutes, @total_seconds = 0, 0, 0
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
    [(@total_hours % 24).to_s, @total_minutes.to_s, @total_seconds.to_s]
  end

  private

  def validate(time)
    pattern = /(^[0|1]?[0-9]|2[0-3]):[0-5]?[0-9]:[0-5]?[0-9]/
    true if pattern.match?(time)
  end

  def extra_time
    extra_minutes, @total_seconds = @total_seconds.divmod(60)
    @total_minutes += extra_minutes
    extra_hours, @total_minutes = @total_minutes.divmod(60)
    @total_hours += extra_hours
  end
end

if ARGV.empty?
  print 'Please provide an input'
else
  object = Time.new
  time = object.sum_time(ARGV)
  print format('%02d:%02d:%02d', time[0], time[1], time[2])
end
