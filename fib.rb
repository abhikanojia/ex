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

recur_fact(6) # 720