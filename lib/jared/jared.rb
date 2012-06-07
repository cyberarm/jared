require 'thor'

class Jared < Thor
 default_task :hi

 desc "time", "Gets the current time."
 def time
  puts "#{Time.now.strftime("%I:%M:%S%P")}"
 end
 
 desc "weather [FORECAST]", "Gets weather information, If no argument then returns current weather information."
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
 
 desc "whereis PLACE", "Finds PLACE via Google Maps"
 def whereis(place)
  require 'launchy'
  Helpers.map(place)
 end
 
 desc "day", "Displays the current day"
 def day
  puts Time.now.strftime("%A")
 end
 
 desc "whatis WORD", "Looks up the meaning of WORD."
 def whatis(word)
  Helpers.define(word)
 end
 
 desc "deamon MAIL/TASK/CAL", "Checks every minute for new mail/tasks/appointments."
 def deamon(function=nil)
  require 'gmail'
  require 'gibberish'
  Helpers.deamon
 end

 desc "jamendo MODE", "Plays music from Jamendo."
 def jamendo(mode='once')
  at_exit do
    require_relative 'lib.rb'
    Lib.db
    @jared = Info.first
    @jared.update_attributes(:author_url => "", :music_url => "", :album_image => "", :album_url => "", :now_playing => "", :now_playing_author => "", :now_playing_album => "")
  end
  Helpers.jamendo(mode)
 end

 desc "play FILE", "Plays File, local or remote."
 def play(media='')
  Helpers.play(media)
 end
 
 desc "task", "Manage your Tasks"
 def task
  require 'green_shoes'
  require 'chronic'
  puts "Task is not yet available."
  Helpers.task
 end
 
 desc "config", "Configure Jared."
 def config
  require 'green_shoes'
  require 'gibberish'
  Helpers.config
 end
 
 desc "view FILENAME", "View file.png in system viewer."
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
 
 desc "hi", "Dynamic greeting based on the current time."
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