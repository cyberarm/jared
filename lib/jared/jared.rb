require 'thor'

class Jared < Thor
 default_task :hi

 desc "time", "Gets the current time."
 def time
  puts "#{Time.now.strftime("%I:%M:%S%P")}"
 end
 
 desc "weather", "Gets the current weather."
 def weather(option=nil)
  require 'google_weather'
  Helpers.weather(option)
 end
 
 desc "clock", "Open a Green Shoes powered clock."
 def clock
  require 'green_shoes'
  Helpers.clock
 end
 
 desc "create TYPE NAME", "create"
 def create(type,name)
  Helpers.create
 end
 
 desc "whereis PLACE", "whereis"
 def whereis(place)
  require 'launchy'
  Helpers.map(place)
 end
 
 desc "day", "Day"
 def day
  puts Time.now.strftime("%A")
 end
 
 desc "whatis WORD", "whatis"
 def whatis(word)
  Helpers.define(word)
 end
 
 desc "deamon FUNCTION", "Checks every minute for mail"
 def deamon(function=nil)
  require 'gmail'
  require 'gibberish'
  Helpers.deamon
 end
 
 desc "task", "Task"
 def task
  require 'green_shoes'
  puts "Task is not yet available."
  Helpers.task
 end
 
 desc "config", "Jared settings."
 def config
  require 'green_shoes'
  Helpers.config
 end
 
 desc "view FILENAME", "View path/to/file.png in system viewer."
 def view(filename)
  if Uname.sysname.include?("Linux")
   puts "Opening #{filename}"
   system("xdg-open #{Dir.pwd}/#{filename}")
  elsif Uname.sysname.include?("Windows")
   puts "Opening #{filename}"
   system("call \"#{Dir.pwd}/#{filename}\"")
  else
   puts "Your system is not supported."
  end
 end
 
 desc "date", "Gets the current date."
 def date
  Helpers.date
 end
 
 desc "hi", "Greetings"
 def hi
  Helpers.greeting
  puts 'For usage information use `jared help`'
 end
 
 desc "cal", "Calendar"
 def cal
  puts "Calendar is not yet available."
  require 'green_shoes'
  Helpers.cal
 end
 
 desc "mail", "Checks your mailbox for new mails."
 def mail
  require 'gmail'
  require 'gibberish'
  Helpers.mail
 end
end

Jared.start