# coding: utf-8
require "common"

class RemoteObject
  def remote_method_with_param(param)
    puts "вызван метод на сервере с параметром #{param.inspect}"
    case param
    when String
      puts "параметр типа строка"
      param.reverse!
    when Array
      puts "параметр типа массив"
      param.shift
    else
      puts "параметр оставшегося типа"
      param.do_smth
    end
  end
end

$SAFE = 1 # Запретить eval() и eval-оподобные вызовы

DRb.start_service(REM_URI, RemoteObject.new)
DRb.thread.join
