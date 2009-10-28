# coding: utf-8
require "common"

rem_o = DRbObject.new_with_uri(REM_URI)

DRb.start_service # Это нужно для объекта, который не копируется при передаче

["строка",
  ["котик", "пёсик", "слоник"],
  MyStringCopied.new("суперстрока"),
  MyStringSingle.new("суперстрока без копий")].each do |obj|
  puts "Вызов метода вернул: #{rem_o.remote_method_with_param(obj).inspect}"
  puts "Параметр после вызова: #{obj.inspect}"
end
