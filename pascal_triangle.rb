def pascal(number)
  (0...number).step(1) do |step|
    i = 1
    sum = 0
    for i in (0..step)
      print i
    end
    print "\n"
  end
end

#pascal(4)
number = 4
    for i in (0..number) do |step|
      var = 1
      for j in (1..(number - step)) { print " " }

        for k in (0..step) do |k|
          cout << "      " << val;
          val = val * (number - k) / (k + 1);
        end
        puts
    end
