class Helpers
 #TODO: Get this working on windows.
 #
 # TODO: make command work it this: <em>jared map Texas, USA</em> instead of using gets.
 def self.map(place)
  @m = place.gsub(" ", "+")
  puts @m
  Launchy.open("http://maps.google.com/?q=#{@m}")
 end
end