def recur_fact
  	i, j = 0, 1
    print i, j
    k = i + j
    while k <= @num
      print k
      i = j
      j = k
      k = i + j
    end
end

def fib(num)
  a, b = 0, 1
  while(a < num)
    yield a
    a, b = b, a + b
  end
end


def fibo
  Enumerator.new do |y|
    a, b = 0, 1
    while true
      y << a
      a, b = b, a + b
    end
  end
end
# recur_fact(6) # 720
p fibo.take(10)
fibo.lazy.select{ |i| print i if i.even? }