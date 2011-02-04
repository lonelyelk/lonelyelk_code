if /\A(?<first>[a-zA-Z]+)\s+(?<last>[a-zA-Z]+)\Z/ =~ "Vassily Poopkine"
  puts [first, last].inspect
end

if md = /\A(?<first>[a-zA-Z]+)\s+(?<last>[a-zA-Z]+)\Z/.match("Vassily Poopkine")
  puts [md[:first], md[:last]].inspect
end

