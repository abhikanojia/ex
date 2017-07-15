# Public - Class for creating sum of time
class SumTime
  attr_accessor :hours, :mins, :seconds
  def initialize(hours, mins, seconds)
    @hours = hours
    @mins = mins
    @seconds = seconds
  end

  def process_time
    seconds if @seconds > 60
    mins if @mins > 60
    hours if @hours > 24
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

  def seconds
    @seconds -= 60
    @mins += 1
  end

  def mins
    @mins -= 60
    @hours += 1
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

if ARGV[0].nil? || ARGV[1].nil?
  print 'Please provide an input'
  exit
else
  pattern = /"(\d)|(\d):(\d)(\d):(\d)(\d)\"/
  if pattern.match(ARGV[0]).inspect && pattern.match(ARGV[1]).inspect

    time_a = TimeFormat.new(ARGV[0]).split_time
    time_b = TimeFormat.new(ARGV[1]).split_time

    seconds = time_a[2] + time_b[2]
    mins =  time_a[1] + time_b[1]
    hours = time_a[0] + time_b[0]

    time = SumTime.new(hours, mins, seconds)
    print time.process_time
  end
end
