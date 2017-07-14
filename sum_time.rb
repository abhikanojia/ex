# splits given string time to hours, mins and seconds
def split_time(time)
  time.split(/:/).map(&:to_i)
end
# returns number of days
def days(hours)
  hours / 24
end
def seconds(seconds)
  seconds -= 60
end
# make time adjustments
def process_time(hours, mins, seconds)
    if seconds > 60
      seconds -= 60
      mins += 1
    end
    if mins > 60
      mins -= 60
      hours += 1
    end

    if hours > 24
      days = days(hours)
      hours %= 24
    end
    if days.nil?
      print "#{"%02d" % hours}:#{"%02d" % mins}:#{"%02d" % seconds}"
    else
      print "#{days} day && #{'%02d' % hours}:#{'%02d' % mins}:#{'%02d' % seconds}"
    end
end

if ARGV[0].nil? || ARGV[1].nil?
  print 'Please provide an input'
  exit
else
  pattern = /"(\d)|(\d):(\d)(\d):(\d)(\d)\"/
  if pattern.match(ARGV[0]).inspect && pattern.match(ARGV[1]).inspect
    time_a = split_time(ARGV[0])
    time_b = split_time(ARGV[1])
    seconds = time_a[2] + time_b[2]
    mins = time_a[1] + time_b[1]
    hours = time_a[0] + time_b[0]
    print process_time(hours, mins, seconds)
  end
end
