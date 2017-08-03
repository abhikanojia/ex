# Public - Class for creating sum of time
class SumTime
  attr_accessor :hours, :mins, :seconds
  def initialize(hours, mins, seconds)
    @hours = hours
    @mins = mins
    @seconds = seconds
  end

  def process_time
    seconds if @seconds >= 60
    mins if @mins >= 60
    hours if @hours >= 24
    if @days.nil?
      print_sum
    else
      print_sum_with_days
    end
  end

  private

  def no_of_days(hours)
    hours / 24
  end

  def add_minutes(seconds)
    seconds / 60
  end

  def add_hours(mins)
    mins / 60
  end

  def seconds
    @mins += add_minutes(@seconds)
    @seconds %= 60
  end

  def mins
    @hours += add_hours(@mins)
    @mins %= 60
  end

  def hours
    @days = no_of_days(@hours)
    @hours %= 24
  end

  def print_sum
    format('%02d', @hours) + ':' + format('%02d', @mins) + ':' \
    + format('%02d', @seconds)
  end

  def print_sum_with_days
    format('%d', @days) + 'day & ' + format('%02d', @hours) + ':' \
      + format('%02d', @mins) + ':' + format('%02d', @seconds)
  end
end
# for converting given string time to integer array
class TimeFormat
  attr_accessor :time_a

  def initialize(time_a)
    @time_a = time_a
  end

  def split_time
    @time_a = @time_a.split(/:/).map(&:to_i)
  end
end
# for handling multiple parameter
class AddTime
  attr_accessor :time

  def initialize(time)
    @time = time
  end

  def p_time
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

if ARGV.empty?
  print 'Please provide an input'
  exit
else
  pattern = /(^[0|1]?[0-9]|2[0-3]):[0-5]?[0-9]:[0-5]?[0-9]/

  time = []
  ARGV.each.with_index do |element, index|
    if pattern.match?(element)
      time[index] = TimeFormat.new(element).split_time
    else
      print 'Invalid 24-hour time value'
      exit
    end
  end
  ob = AddTime.new(time)
  print '"' + ob.add_time + '"'
end
