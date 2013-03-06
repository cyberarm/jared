require 'gtk2'
require 'open-uri'
require 'json'
require 'gst'
require_relative "../../../database"

class Action
  class Jamendo
    attr_accessor :playloop, :playbin
    def length(l)
      @m="#{l.to_i.divmod(60)[0]}m"
      if defined?(l.to_i.divmod(60)[1])
        @s="#{l.to_i.divmod(60)[1]}s"
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

    def find_user_prefered_radio
      Lib.db
      @user  = User.first
      @user.music

      @radios = open("http://api.jamendo.com/get2/id+name/radio/json/?n=all").read
      @radio_id = 0
      @radio_data=JSON.parse(@radios)
      @radio_data.select do |radio|
        next unless radio['name'] == @user.music
        @radio_id = radio['id']
      end
    end

    def jamendo(mode='play')
      mode=mode.downcase
      find_user_prefered_radio

      sleep 1

      @list = open("http://api.jamendo.com/get2/name+stream+artist_name+duration/track/json/track_album+album_artist/?radioid=#{@radio_id}&n=100&streamencoding=ogg2").read
      @d = JSON.parse(@list)
      if mode == 'play'
        puts 'Starting loop, use CTRL-Pause(Break) to stop.'
        (@d.count-1).times do |v|
          @data = @d[v]
          player(v)
        end
      end
    end
  end
end

a=Action::Jamendo.new.jamendo