class MyComp
  attr :value
  include Comparable
  def initialize(val)
    @value = val
  end

  def <=>(other)
    @value <=> other.value
  end
end

v1 = MyComp.new(1)
v2 = MyComp.new(2)

puts v1 < v2
puts v1 <= v2
puts v1 > v2
puts v1 >= v2
puts v1 == v2
