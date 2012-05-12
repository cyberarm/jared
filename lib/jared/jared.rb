class Jared < Thor
 def self.time(t="now")
  if t == "now"
   puts "#{Time.now.strftime("%I:%M:%S%P")}"
  end
 end
end
 
case ARGV[0]
when "hi", "Hi", "hello", "Hello"
 Helpers.greeting

when "view", "View"
 if Uname.sysname.include?("Linux")
  puts "Opening #{ARGV[1]}"
  system("xdg-open #{Dir.pwd}/#{ARGV[1]}")
 elsif Uname.sysname.include?("Windows")
  puts "Opening #{ARGV[1]}"
  system("call \"#{Dir.pwd}/#{ARGV[1]}\"")
 else
  puts "Your system is not supported."
 end
 
when "calc", "Calc", "calculator", "Calculator"
 Helpers.calc
 
when "clock", "Clock"
 require 'green_shoes'
 Helpers.clock
 
when "date", "Date"
 Helpers.date
 
when "config", "Config", "configure", "Configure"
 require 'green_shoes'
 Helpers.config
 
when "cal", "Cal", "calendar", "Calendar"
 require 'green_shoes'
 puts "Calendar is not yet available."
 Helpers.cal
 
when "task", "Task"
 require 'green_shoes'
 puts "Task is not yet available."
 Helpers.task
 
when "day", "Day"
 puts Time.now.strftime("%A")

when "deamon", "Deamon"
 require 'gmail'
 require 'google_weather'
 require 'gibberish'
 #puts "Deamon is not yet available."
 Helpers.deamon

when "time", "Time"
 puts Jared.time
 
when "whatis", "Whatis"
 Helpers.define(ARGV[1])
 
when "whereis", "Whereis"
  require 'launchy'
# if Uname.sysname.include?("Windows")
#  puts "Function unavailable on Windows do to Launchy malfunctioning. Sorry :("
# else
  Helpers.map
# end
 
when "create", "Create"
 Helpers.create
 
when "weather", "Weather"
 require 'google_weather'
 Helpers.weather(ARGV[1])
 
when "mail", "Mail"
 require 'gmail'
 require 'gibberish'
 Helpers.mail
  
else
 Helpers.notfound
end