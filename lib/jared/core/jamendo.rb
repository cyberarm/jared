class Action
  class Jamendo
    attr_accessor :playloop, :playbin
    def length(l)
      @m="#{l.to_i.divmod(60)[0]} minutes"
      if defined?(l.to_i.divmod(60)[1])
        @s="#{l.to_i.divmod(60)[1]} seconds"
      else
        @s=nil
      end
      return "#{@m} #{@s}"
    end

    def player(n=0)
      puts "Now playing: #{@data['name']}, By: #{@data['artist_name']} (#{length(@data['duration'])})"
      @playbin = Gst::ElementFactory.make('playbin2')
      @playbin.ready
      @playloop = GLib::MainLoop.new(nil, false)
      @playbin.bus.add_watch {|bus, message|
        case message.type
          when Gst::Message::EOS
            @playloop.quit
          when Gst::MessageError
            @playloop.quit
            @playbin.stop
        end
        true}
        @playbin.uri = @data['stream']
        @playbin.play
        begin
          @playloop.run
        rescue Interrupt
        ensure
          @playbin.stop
      end
    end

    # at_exit do
    #   require_relative 'lib.rb'
    #   Lib.db
    #   @jared = Music.first
    #   @jared.update_attributes(:author_url => "", :music_url => "", :album_image => "", :album_url => "", :now_playing => "", :now_playing_author => "", :now_playing_album => "")
    # end

    def jamendo(mode='play')
      mode=mode.downcase
      Lib.db
      @jared = Music.first
      @user  = User.first
      require 'gtk2'
      require 'open-uri'
      require 'json'
      require 'gst'
      @list = open("http://api.jamendo.com/get2/name+url+stream+album_name+album_url+album_image+artist_name+artist_url+duration/track/json/track_album+album_artist/?n=100&streamencoding=ogg2&order=rating_desc&tag_idstr=#{@user.music}").read
      @d = JSON.parse(@list)
      if mode == 'play'
        puts 'Starting loop, use CTRL-Pause(Break) to stop.'
        loop do
          v = Random.rand(0..@d.count-1)
          @data = @d[v]
          @jared.update_attributes(:author_url => "#{@data['artist_url']}", :album_image => "#{@data['album_image']}", :music_url => "#{@data['url']}", :album_url => "#{@data['album_url']}", :now_playing => "#{@data['name']}", :now_playing_author => "#{@data['artist_name']}", :now_playing_album => "#{@data['album_name']}")
          player(v)
        end
      elsif mode == 'help'
        puts 'loop|once'
      end
    end
  end
end