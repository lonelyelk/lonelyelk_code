# coding: utf-8
require "thwait"

t1 = Thread.new do
  10.times do |i|
    puts "поток 1 тик #{i}"
    sleep 0.5
  end
end

t2 = Thread.new do
  10.times do |i|
    puts "поток 2 тик #{i}"
    sleep 0.7
  end
end

t3 = Thread.new do
  10.times do |i|
    puts "поток 3 тик #{i}"
    sleep 0.3
  end
end

run = true
tw = ThreadsWait.new t1, t2, t3

while run do
  begin
    puts "Закончил работу #{tw.next_wait(true).inspect }"
    run = false
  rescue ThreadsWait::ErrNoFinishedThread
    puts "Ожидаем окончания работы одного из потоков"
    sleep 0.5
  end
end

tw.all_waits do |t|
  puts "Закончил работу #{t.inspect}"
end
