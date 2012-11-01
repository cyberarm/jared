class Action
# Not yet implemented.
#
# _jared_ _cal_ Manage your appointments in a Green Shoes app.
  class Calendar
    def calendar
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
end