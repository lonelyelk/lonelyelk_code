# coding: utf-8

module T1
end
module T2
  include T1
end
T3 = T1

class C1
end
class C2 < C1
end
C3 = C1

puts "T1 <=> T2: #{(T1 <=> T2).inspect}"
puts "T1 <=> T3: #{(T1 <=> T3).inspect}"
puts "C1 <=> C2: #{(C1 <=> C2).inspect}"
puts "C1 <=> C3: #{(C1 <=> C3).inspect}"
puts "C1 <=> T1: #{(C1 <=> T1).inspect}"
puts "T1 <=> C1: #{(T1 <=> C1).inspect}"

C3.send(:include, T1)

puts "после включения"
puts "C1 <=> T1: #{(C1 <=> T1).inspect}"
puts "T1 <=> C1: #{(T1 <=> C1).inspect}"

