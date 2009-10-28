# coding: utf-8
$KCODE = "utf-8" if RUBY_VERSION < "1.9.0"
require "drb/drb"

class RemoteObject
  def remote_method_with_param(param)
    puts "вызван метод на сервере с параметром #{param.inspect}"
    case param.class.to_s
    when "String"
      puts "параметр типа строка"
      param.reverse!
    when "Array"
      puts "параметр типа массив"
      param.shift
    else
      puts "параметр оставшегося типа"
      param.do_smth
    end
  end
end

$SAFE = 1 # Запретить eval() и eval-оподобные вызовы

DRb.start_service("druby://localhost:45678", RemoteObject.new)
DRb.thread.join
