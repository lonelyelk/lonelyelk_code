print "child: "
child = gets.chomp
puts "child tainted: #{child.tainted?}"
(0..4).to_a.each do |i|
  puts "SAFE: #{i}"
  $a = "safe"
  th = Thread.new do
    $SAFE = i
    child_copy = child.dup
    Thread.current[:out] = ""

    begin
      load child_copy
      Thread.current[:out] += "1. Child loaded\n"
    rescue SecurityError => e
      Thread.current[:out] += "1. Security error: #{e.to_s}\n"
      begin
        child_copy.untaint
        load child_copy
        Thread.current[:out] += "2. Child untainted and loaded\n"
      rescue SecurityError => e
        Thread.current[:out] += "2. Security error: #{e.to_s}\n"
        begin
         Thread.current[:out] += "3. Read from file '#{child_copy}': '#{File.read(child_copy)}'\n"
        rescue SecurityError => e
          Thread.current[:out] += "3. Security error: #{e.to_s}\n"
          begin
           Thread.current[:out] += "4. Read from untainted file: '#{File.read("child.rb")}'\n"
          rescue SecurityError => e
            Thread.current[:out] += "4. Security error: #{e.to_s}\n"
          end
        end
      end
    end

    begin
      $a = "modified"
      Thread.current[:out] +=  "5. Global variable modified: $a = '#{$a}'\n"
    rescue SecurityError => e
      Thread.current[:out] += "5. Security error: #{e.to_s}\n"
    end

    begin
      Dir.mkdir "test"
      Thread.current[:out] += "6. Created directory 'test': #{File.exist?("test")}\n"
      Dir.rmdir "test"
    rescue SecurityError => e
      Thread.current[:out] += "6. Security error: #{e.to_s}\n"
    end

    begin
      Thread.current[:out] +=  "7. Dir glob: #{Dir.glob(File.join("..", "*")).inspect}\n"
    rescue SecurityError => e
      Thread.current[:out] += "7. Security error: #{e.to_s}\n"
    end

    begin
      Thread.current[:out] +=  "8. System ls output: '#{`ls`.chomp}'"
    rescue SecurityError => e
      Thread.current[:out] += "8. Security error: #{e.to_s}\n"
    end
  end
  th.join
  puts "Global variable: $a = '#{$a}'"
  puts th[:out] if th[:out]
end
