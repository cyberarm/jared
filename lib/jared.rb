require 'etc'
require "fileutils"
require 'sys/uname'
require 'launchy'
require 'sqlite3'
require 'active_record'
 include Sys
require_relative "jared/lib.rb"
#require "jared/lib"

ActiveRecord::Base.establish_connection(
 :adapter => 'sqlite3',
 :database => "#{Etc.getpwuid.dir}/.jared.sqlite3")

unless File.exist?("#{Etc.getpwuid.dir}/.jared.sqlite3")
 ActiveRecord::Schema.define do
  create_table :tasks do |t|
   t.column :title, :string
   t.column :desciption, :string
   t.column :due, :string
   t.timestamps
  end
 end
end

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
when "hi", "Hi", "hello", "Hello"
 Helpers.greeting

when "view", "View"
 puts "Opening #{ARGV[1]}"
 if Uname.sysname == "Linux"
  system("xdg-open #{Dir.pwd}/#{ARGV[1]}")
 elsif Uname.sysname == "Windows"
  system("\"#{Dir.pwd}/#{ARGV[1]}\"")
 else
  puts "Your system is not supported."
 end
 
when "calc", "Calc", "calculator", "Calculator"
 Helpers.calc(a=ARGV[1], b=ARGV[2], c=ARGV[3])
 
when "clock", "Clock"
 Jared.clock
 
when "date", "Date"
 Jared.date
 
when "cal", "Cal", "calendar", "Calendar"
 puts "Calendar is not yet available."
 if Dir.pwd.include?("/home/#{Etc.getlogin}/jared")
  Helpers.cal
 end
 
when "task", "Task"
 puts "Task is not yet available."
 Helpers.task
 
when "day", "Day"
 puts Time.now.strftime("%A")

when "deamon", "Deamon"
puts "Deamon is not yet available."
Helpers.deamon

when "time", "Time"
 puts Jared.time
 
when "whatis", "Whatis"
 Helpers.define(ARGV[1])
 
when "whereis", "Whereis"
 Helpers.map
 
when "create", "Create"
 Helpers.create
  
else
 Helpers.notfound
end
