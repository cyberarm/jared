class Action
  class Date
    # Date and Time
    #
    # _jared_ _time_ returns the current time.
    #
    #e.g.
    #
    #02:33:19pm
    #
    # _Jared_ _date_ returns the current date.
    #
    #e.g.
    #
    #Tuesday the 1st of May 2012
    #
    #(05/01/2012)
    def date
      st = "#{Time.now.strftime("%A the %dst of %B %Y")}"
      nd = "#{Time.now.strftime("%A the %dnd of %B %Y")}"
      rd = "#{Time.now.strftime("%A the %drd of %B %Y")}"

      if Time.now.strftime("%d") == "02"
        puts nd.gsub("0", "")
      elsif Time.now.strftime("%d") == "22"
        puts nd
      elsif  Time.now.strftime("%d") == "03"
        puts rd
      elsif Time.now.strftime("%d") == "33"
        puts rd
      elsif Time.now.strftime("%d") == "21"
        puts st
      elsif Time.now.strftime("%d") == "31"
        puts st
      elsif Time.now.strftime("%d") == "01"
        puts st.gsub("0", "")
      else
        puts "#{Time.now.strftime("%A the %dth of %B %Y")}"
      end
      puts "(#{Time.now.strftime("%m/%d/%Y")})"
    end
  end
end