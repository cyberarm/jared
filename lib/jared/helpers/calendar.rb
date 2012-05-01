class Helpers
 def self.cal
  require "green_shoes"
  Shoes.app do
   title "Calendar Events"
   events = ["Sidney", "Call Bob"]
   events.each do |e|
    para e
   end
  end
 end
end