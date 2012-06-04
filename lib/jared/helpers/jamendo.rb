class Helpers
  def self.jamendo(mode='loop')
    require 'gtk2'
    require 'open-uri'
    require 'json'
    require 'gst'
    @name = []
    @author = []
    @playlist = []
    @list = open("http://api.jamendo.com/get2/name+url+stream+album_name+album_url+artist_name/track/json/track_album+album_artist/?n=50&order=ratingmonth_desc&tag_idstr=classical").read
    JSON.parse(@list).each do |d|
      @playlist << d['stream']
    end
    JSON.parse(@list).each do |d|
      @name << d['name']
    end
    JSON.parse(@list).each do |d|
      @author << d['artist_name']
    end

    def player(n=0)
    puts "Now playing: #{@name[n]}, By: #{@author[n]}"
      @playbin = Gst::ElementFactory.make('playbin2')
      @playbin.uri = @playlist[n]
      loop = GLib::MainLoop.new(nil, false)
        bus = @playbin.bus
      bus.add_watch {|bus, message|
        case message.type
          when Gst::Message::EOS
            loop.quit
        end
        true}
        @playbin.play
       begin
        loop.run
       rescue Interrupt
       ensure
        @playbin.stop
       end
      end
      
    if mode == loop
      while play == true
        player(Rand.random(0..49))
      end
    elsif mode == once
      player(Rand.random(0..49))
    else
      mode.times do
        player(Random.random(0..49))
      end
    end
      
  end
end