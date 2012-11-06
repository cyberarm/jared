require 'weatherboy'
require 'area'

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
      option=option.downcase unless option.nil?
      @user = User.first
      begin
        weather = Weatherboy.new(@user.zip)
        puts @user.zip.to_region
        if option == nil
          forecast = weather.current
          puts forecast.temp_f + " Degrees Fahrenheit.", forecast.weather + ".", forecast.wind_mph + " mile per hour winds from the #{forecast.wind_dir}."

        elsif option == "today"
          condition=weather.forecasts[0]
          puts "#{condition.title}."
          puts " #{condition.text}"

        elsif option == "tomorrow"
          condition=weather.forecasts[1]
          puts "#{condition.title}."
          puts " #{condition.text}"

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

Action::Weather.new.weather unless defined?(ARGV[1].length)
Action::Weather.new.weather(ARGV[1]) if defined?(ARGV[1].length)