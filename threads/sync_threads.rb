$cnt = 0

t3 = Thread.new do
  100000.times { $cnt += 1 }
end

t4 = Thread.new do
  100000.times { $cnt += 1 }
end

t3.join
t4.join

puts $cnt
