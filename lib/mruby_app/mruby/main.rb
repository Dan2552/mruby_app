class Object
  def method_missing(meth, *args, &blk)
    raise NoMethodError, "Undefined method '#{meth}' for #{self.class} - #{self.inspect}"
  end
end

begin
  main
rescue => e
  $stderr.print "\n\e[31m"
  $stderr.print e.inspect
  $stderr.puts "\e[0m"
  e.backtrace.each.with_index do |line, index|
    file = line.split(":").first
    next if file == __FILE__

    $stderr.print "\e[36m"
    $stderr.puts line
    $stderr.print "\e[0m"
  end
end
