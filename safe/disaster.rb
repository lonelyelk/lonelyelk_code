Thread.new do
  $SAFE = 2
  class String
    def ==(other_string)
      true
    end
  end
end.join
puts "string modified: #{"a" == "b"}"

