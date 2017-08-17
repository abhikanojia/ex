require 'time'

class Time
  def self.add(arg)
    t1 = arg.delete(arg.first)
    arg.inject(t1) { |sum, time| sum += time.hour * 3600 + time.min * 60 + time.sec }
  end
end

if ARGV.first.nil?
  print 'Please provide an input'
else
  time_array = []
  ARGV.each { |time_str| time_array.push(Time.parse(time_str)) }
  print Time::add(time_array)
end