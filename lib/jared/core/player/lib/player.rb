require 'sys/uname'
 include Sys

class Action
  class Player
    def play(request='')
      unless Uname.sysname.include?('Windows')
        puts 'Your platform is not supported by green_shoes Video.'
        Kernel.exit
      end
    require 'green_shoes'
      Shoes.app title: 'JaredPlayer' do
        background gray..black, angle: 90
        $v = video request
        timer 1 do
         $v.play
        end
        button 'Play/Pause' do
          if $v.playing?
            $v.pause
          else
            $v.play
          end
        end
        button 'Stop' do
          $v.stop
        end
      end
    end
  end
end

Action::Player.new.play(ARGV[1])