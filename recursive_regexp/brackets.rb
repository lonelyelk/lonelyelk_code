str = "1 + 2 * (3 - 4 / (5 + 6) + (7 - 8 * (9 + 10 * 11) + 12) * 13 - 14) + 15 * (16 - 17)"

re = %r{
        (?<fill>[0-9+\-*/\s]+){0}
        (?<expression>\g<fill>*\g<bracket>\g<fill>*|\g<fill>){0}
        (?<bracket>\(\g<expression>+\))
}x

def calculator(str)
  if str =~ /\A[0-9+\-*\/\s]+\Z/
    eval str
  else
    raise "Invalid expression: #{str}"
  end
end

f =-> s do
  if $~[:expression] == $~[:fill]
    calculator($~[:fill])
  else
    calculator($~[:bracket][1..-2].gsub(re, &f))
  end
end

puts calculator(str.gsub(re, &f))
puts eval(str)

