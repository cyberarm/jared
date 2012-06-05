class Helpers
  
  def self.player(n=0)
    Lib.db
    @jared = Jared.first
    puts "Now playing: #{@name[n]}, By: #{@author[n]} (#{n})"
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
  
  def self.jamendo(mode='once')
    require 'gtk2'
    require 'open-uri'
    require 'json'
    require 'gst'
    @name = []
    @author = []
    @playlist = []
    @list = open("http://api.jamendo.com/get2/name+url+stream+album_name+album_url+artist_name/track/json/track_album+album_artist/?n=100&order=ratingmonth_desc&tag_idstr=classical").read
    JSON.parse(@list).each do |d|
      @playlist << d['stream']
    end
    JSON.parse(@list).each do |d|
      @name << d['name']
    end
    JSON.parse(@list).each do |d|
      @author << d['artist_name']
    end

    if mode == 'loop'
      puts 'Starting loop, use CTRL-Pause(Break) to stop.'
      loop do
        v = Random.rand(0..49)
        @jared.update_attributes(:now_playing => "#{@name[v]}", :now_playing_author => "#{@author[v]}")
        Helpers.player(v)
      end
    elsif mode == 'once'
      v = Random.rand(0..49)
      @jared.update_attributes(:now_playing => "#{@name[v]}", :now_playing_author => "#{@author[v]}")
      Helpers.player(v)
    elsif mode == 'help'
      puts 'loop|once'
    else
      v = mode.to_s.to_i
      @jared.update_attributes(:now_playing => "#{@name[v]}", :now_playing_author => "#{@author[v]}")
      Helpers.player(mode.to_s.to_i)
    end
      
  end
end