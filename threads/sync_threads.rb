# coding: utf-8
$cnt = 0

t1 = Thread.new do
  100000.times { $cnt += 1 }
end

t2 = Thread.new do
  100000.times { $cnt += 1 }
end

t1.join
t2.join

puts "Without sync: #{$cnt}"

require "thread"
$cnt = 0
$mutex = Mutex.new

t3 = Thread.new do
  $mutex.synchronize do
    100000.times { $cnt += 1 }
  end
end

t4 = Thread.new do
  $mutex.synchronize do
    100000.times { $cnt += 1 }
  end
end

t3.join
t4.join

puts "With sync: #{$cnt}"
