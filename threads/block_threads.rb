# coding: utf-8
require "block_thread.so"

t1 = Thread.new do
  10.times { |i| puts i; sleep 0.1 }
end

t2 = Thread.new do
  puts "Блокируем"
  BlockThread.cycle
  puts "Разблокируем"
end

t3 = Thread.new do
  puts "Стараемся не блокировать"
  BlockThread.cycle_with_schedule
  puts "Закончили стараться"
end
t1.join
t2.join
t3.join
