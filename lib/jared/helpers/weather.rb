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
 $day = "Thurs"
 $dn = "Thursday"#correct
elsif Time.now.strftime("%a") == "Thurs"
 $day = "Fri"
 $dn = "Friday"
elsif Time.now.strftime("%a") == "Fri"
 $day = "Sat"
 $dn = "Saturday"
elsif Time.now.strftime("%a") == "Sat"
 $day = "Sun"
 $dn = "Sunday"
end

class Helpers
Lib.db 
 require_relative "../models/user.rb"
 @user = User.first
 # Checks weather.
 #
 # Usage: <em>jared weather (10001/today/tomorrow/forecast)</em>
 def self.weather(zip)
  begin
   weather = GoogleWeather.new(@user.zip)

  if ARGV[1] == nil
   forecast = weather.current_conditions
   puts weather.forecast_information.city
   puts forecast.temp_f + " Degrees Fahrenheit", forecast.temp_c + " Degrees Celsius", forecast.condition, forecast.wind_condition, forecast.humidity
   
  elsif ARGV[1] == "today"
   weather.forecast_conditions.each do |condition|
    if condition.day_of_week == Time.now.strftime("%a")
     puts Time.now.strftime("%A")
     puts " #{condition.condition}"
     puts " High: #{condition.high} Degrees Fahrenheit"
     puts " Low: #{condition.low} Degrees Fahrenheit"
	end
   end
   
  elsif ARGV[1] == "tomorrow"
   weather.forecast_conditions.each do |condition|
    if condition.day_of_week == $day
     puts $dn
     puts " #{condition.condition}"
     puts " High: #{condition.high} Degrees Fahrenheit"
     puts " Low: #{condition.low} Degrees Fahrenheit"
	end
   end
   
  elsif ARGV[1] == "forecast"
   weather.forecast_conditions.each do |condition|
    puts "#{condition.day_of_week}"
    puts " #{condition.condition}"
    puts " High: #{condition.high} Degrees Fahrenheit"
    puts " Low: #{condition.low} Degrees Fahrenheit"
   end
  else
   puts "Unable to fetch weather due to argument error."
  end
  rescue SocketError
   puts "A connection error occurred fetching weather information."
  end
 end
end