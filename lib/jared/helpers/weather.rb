class Helpers
Lib.db
 
 require_relative "../models/user.rb"
 @user = User.first
 def self.weather(zip)
  begin
  if zip == nil
   weather = GoogleWeather.new(@user.zip)
  else
   weather = GoogleWeather.new(zip)
  end
  forecast = weather.current_conditions
  puts forecast.temp_f + " Degrees Fahrenheit", forecast.condition
  rescue SocketError
   puts "A connection error occurred fetching weather information."
  end
 end
end