require "block_thread.so"

t1 = Thread.new do
  10.times { |i| puts i; sleep 0.1 }
end

t2 = Thread.new do
  puts "Блокируем"
  BlockThread.cycle
  puts "Разблокируем"
end

t1.join
t2.join
