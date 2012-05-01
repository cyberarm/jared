class Helpers
 def self.map
  print "search Gmaps for >"
  @m = STDIN.gets.chomp
  puts "Opening Gmaps in default browser."
  puts "#{@m}"
  if Uname.sysname.include?("Windows")
   puts "Unavailable on Windows. :("
  else
  Launchy.open("http://maps.google.com/?q=#{@m}")
  end
 end
end