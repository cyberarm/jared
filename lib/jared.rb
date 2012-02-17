require 'etc'
require 'sys/uname'
 include Sys
#require_relative "jared/lib.rb"
require "jared/lib"

begin
 require "green_shoes"
rescue LoadError
 puts "Please install 'green_shoes' for more functionality"
end

class Jared
 def self.time(t="now")
  if t == "now"
   puts "#{Time.now.strftime("%I:%M:%S%P")}"
  end
 end
 
 def self.date
  Helpers.date
 end
 
 def self.clock
  begin 
   require "green_shoes"
   Helpers.clock
  rescue LoadError
   puts "Error: Clock requires 'green_shoes'"
  end
 end
 
end

case ARGV[0]
when "hi", "hello"
 Helpers.greeting

when "view"
 puts "Opening #{ARGV[1]}"
 if Uname.sysname == "Linux"
  system("xdg-open #{Dir.pwd}/#{ARGV[1]}")
 elsif Uname.sysname == "Windows"
  system("\"#{Dir.pwd}/#{ARGV[1]}\"")
 else
  puts "Your system is not supported."
 end
 
when "calc", "calculator"
 Helpers.calc(a=ARGV[1], b=ARGV[2], c=ARGV[3])
 
when "clock"
 Jared.clock
 
when "date"
 Jared.date
 
when "cal", "calendar"
 puts "Calendar is not yet available."
 Helpers.cal
 
when "task"
 puts "Task is not yet available."
 
when "day"

when "deamon"
puts "Deamon is not yet available."
Helpers.deamon

when "time"
 puts Jared.time
else
 Helpers.notfound
end
