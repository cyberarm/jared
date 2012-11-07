class Action
  class Map
    # <em>jared map Texas, USA</em> will open GMaps to Texas, USA.
    def map(place=ARGV[1])
      @m = place.gsub(" ", "+")
      puts @m
      Launchy.open("http://maps.google.com/?q=#{@m}")
    end
  end
end

Action::Map.new.map