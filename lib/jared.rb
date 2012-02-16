require 'etc'
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
 puts "View is not yet available."
 #system("#{Dir.pwd}/#{ARGV[1]}")
 
when "clock"
 Jared.clock
 
when "date"
 Jared.date
 
when "cal", "calendar"
 puts "Calendar is not yet available."
 
when "task"
 puts "Task is not yet available."
 
when "day"

when ""

when "time"
 puts Jared.time
else
 Helpers.notfound
end
