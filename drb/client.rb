# coding: utf-8
$KCODE = "utf-8" if RUBY_VERSION < "1.9.0"
require "drb/drb"

class MyString
  def initialize(str)
    @string = str
  end
  
  def do_smth
    @string.reverse!
  end
  
  def inspect
    "<#{@string}>"
  end
end

rem_o = DRbObject.new_with_uri("druby://localhost:45678")

["строка", ["котик", "пёсик", "слоник"], MyString.new("суперстрока")].each do |obj|
  puts "Вызов метода вернул: #{rem_o.remote_method_with_param(obj).inspect}"
  puts "Параметр после вызова: #{obj.inspect}"
end
