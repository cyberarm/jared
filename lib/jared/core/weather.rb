if Time.now.strftime("%a") == "Sun"
  $day = "Mon"
  $dn = "Monday"
elsif Time.now.strftime("%a") == "Mon"
  $day = "Tue"
  $dn = "Tuesday"
elsif Time.now.strftime("%a") == "Tue"
  $day = "Wed"
  $dn = "Wednesday"
elsif Time.now.strftime("%a") == "Wed"
  $day = "Thu"
  $dn = "Thursday"
elsif Time.now.strftime("%a") == "Thu"
  $day = "Fri"
  $dn = "Friday"
elsif Time.now.strftime("%a") == "Fri"
  $day = "Sat"
  $dn = "Saturday"
elsif Time.now.strftime("%a") == "Sat"
  $day = "Sun"
  $dn = "Sunday"
end

class Action
  class Weather
    Lib.db
    # Checks weather.
    #
    # Usage: <em>jared weather (10001/today/tomorrow/forecast)</em>
    def weather(option=nil)
      @user = User.first
      begin
        weather = Weatherboy.new(@user.zip)
        if option == nil
          forecast = weather.current
          puts @user.zip.to_i.to_region
          puts forecast.temp_f + " Degrees Fahrenheit.", forecast.weather + ".", forecast.wind_mph + " mile per hour winds from the #{forecast.wind_dir}."

        elsif option == "today"
          weather.forecasts.each do |condition|
          if condition.title == 'Today'
            puts "#{condition.title}."
            puts " #{condition.text}"
          end
        end

        elsif option == "tomorrow"
          weather.forecasts.each do |condition|
          if condition.title == $dn
            puts "#{condition.title}."
            puts " #{condition.text}"
          end
        end

        elsif option == "forecast"
          weather.forecasts.each do |condition|
          puts "#{condition.title}."
          puts " #{condition.text}"
          puts
        end
        else
          puts "Unable to fetch weather due to argument error."
        end
      rescue SocketError
        puts "A connection error occurred fetching weather information."
      end
    end
  end
end