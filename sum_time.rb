class SumTime
  attr_accessor :time

  def intialize(*time)
    @time = time
  end

  def print_t
    p @time
  end

  def add_time
    seconds = a_seconds
    mins = a_minutes
    hours = a_hours
    time = SumTime.new(hours, mins, seconds)
    time.process_time
  end

  private

  def a_seconds
    seconds = 0
    @time.each.with_index do |_, index|
      seconds += @time[index][2]
    end
    seconds
  end

  def a_minutes
    minutes = 0
    @time.each.with_index do |_, index|
      minutes += @time[index][1]
    end
    minutes
  end

  def a_hours
    hours = 0
    @time.each.with_index do |_, index|
      hours += @time[index][0]
    end
    hours
  end
end
