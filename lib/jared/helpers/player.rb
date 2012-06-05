class Helpers
  def self.play(request='')
  require 'green_shoes'
  Shoes.app title: 'JaredPlayer' do
    background gray..black, angle: 90
    $v = video request#ARGV[0]
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