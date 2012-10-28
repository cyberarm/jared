class Task
  class Map
    # <em>jared map Texas, USA</em> will open GMaps to Texas, USA.
    def map(place)
      @m = place.gsub(" ", "+")
      puts @m
      Launchy.open("http://maps.google.com/?q=#{@m}")
    end
  end
end