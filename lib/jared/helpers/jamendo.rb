class Helpers
  
  def self.player(n=0)
    puts "Now playing: #{@data['name']}, By: #{@data['artist_name']} (#{n})"
    @playbin = Gst::ElementFactory.make('playbin2')
    @playbin.uri = @data['stream']
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
    Lib.db
    @jared = Music.first
    @user  = User.first
    require 'gtk2'
    require 'open-uri'
    require 'json'
    require 'gst'
    @list = open("http://api.jamendo.com/get2/name+url+stream+album_name+album_url+album_image+artist_name+artist_url/track/json/track_album+album_artist/?n=25&order=ratingmonth_desc&tag_idstr=#{@user.music}").read
    @d = JSON.parse(@list)
    @data = @d[2]

    if mode == 'loop'
      puts 'Starting loop, use CTRL-Pause(Break) to stop.'
      loop do
        v = Random.rand(0..24)
        @data = @d[v]
        @jared.update_attributes(:author_url => "#{@data['artist_url']}", :album_image => "#{@data['album_image']}", :music_url => "#{@data['url']}", :album_url => "#{@data['album_url']}", :now_playing => "#{@data['name']}", :now_playing_author => "#{@data['artist_name']}", :now_playing_album => "#{@data['album_name']}")
        Helpers.player(v)
      end
    elsif mode == 'once'
      v = Random.rand(0..49)
      @data = @d[v]
      @jared.update_attributes(:author_url => "#{@data['artist_url']}", :album_image => "#{@data['album_image']}", :music_url => "#{@data['url']}", :album_url => "#{@data['album_url']}", :now_playing => "#{@data['name']}", :now_playing_author => "#{@data['artist_name']}", :now_playing_album => "#{@data['album_name']}")
      Helpers.player(v)
    elsif mode == 'help'
      puts 'loop|once'
    else
      v = mode.to_s.to_i
      @data = @d[v]
      @jared.update_attributes(:author_url => "#{@data['artist_url']}", :album_image => "#{@data['album_image']}", :music_url => "#{@data['url']}", :album_url => "#{@data['album_url']}", :now_playing => "#{@data['name']}", :now_playing_author => "#{@data['artist_name']}", :now_playing_album => "#{@data['album_name']}")
      Helpers.player(mode.to_s.to_i)
    end
  end
end