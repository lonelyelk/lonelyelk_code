# coding: utf-8
$KCODE = "utf-8" if RUBY_VERSION < "1.9.0"
require "drb/drb"

REM_URI = "druby://localhost:45678"

class MyStringCopied
  def initialize(str)
    @string = str
  end
  
  def do_smth
    @string.reverse!
    self
  end
  
  def inspect
    "<<#{@string}>>"
  end
end

class MyStringSingle
  include DRb::DRbUndumped # это ключ :)
  def initialize(str)
    @string = str
  end
  
  def do_smth
    @string.reverse!
    self
  end
  
  def inspect
    "<#{@string}>"
  end
end

