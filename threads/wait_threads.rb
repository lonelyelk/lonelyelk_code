# coding: utf-8
require "thwait"

t1 = Thread.new do
  10.times { |i| puts "поток 1 тик #{i}"; sleep 0.5 }
end

t2 = Thread.new do
  10.times { |i| puts "поток 2 тик #{i}"; sleep 0.7 }
end

tw = ThreadsWait.new t1, t2

t3 = Thread.new do
  10.times { |i| puts "поток 3 тик #{i}"; sleep 0.3 }
end

run = true
tw.join_nowait t3

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
