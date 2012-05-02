class Helpers
# == Clock
# _jared_ _clock_ Opens a digital clock in a Green Shoes app.
 def self.clock
  begin 
   require "green_shoes"
   Shoes.app width: 400,  height: 70, title: "Jared Clock" do
    @clock = stack do
     title "#{Time.now.strftime("%I:%M:%P")}"
    end
    every 0.5 do
     @clock.clear do
      title "#{Time.now.strftime("%I:%M:%S%P")}"
     end
    end
   end
  rescue LoadError
  end
 end
end