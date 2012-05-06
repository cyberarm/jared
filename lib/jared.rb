#!/bin/ruby
require "faster_require"
require 'etc'
require "fileutils"
require 'sys/uname'
require 'launchy'
require 'green_shoes'
require 'sqlite3'
require 'active_record'
require 'google_weather'
require 'gmail'
require 'time'
require 'gibberish'
 include Sys

unless File.exist?("#{Dir.home}/.jared.sqlite3")
puts "Setting up database."
ActiveRecord::Base.establish_connection(:adapter => 'sqlite3', :database => "#{Dir.home}/.jared.sqlite3")
ActiveRecord::Migration.verbose = false

 ActiveRecord::Schema.define do
  create_table :tasks do |t|
   t.column :title, :string
   t.column :desciption, :string
   t.column :due, :string
   t.timestamps
  end
 end

 ActiveRecord::Schema.define do
  create_table :users do |t|
   t.column :name, :string
   t.column :zip, :string
   t.column :mail_username, :string
   t.column :mail_password, :string
   t.column :mail_provider,  :string
   t.timestamps
  end
 end
end

require_relative "jared/lib.rb"
#require "jared/lib"
Lib.db
if User.first.blank?
 new_user = User.new(:name => "#{Etc.getlogin}", :zip => "10001")
 c=confirm "Setup Jared?"
 if c == true
  Helpers.config
 else
 end
end

class Jared
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
 Helpers.clock
 
when "date", "Date"
 Helpers.date
 
when "config", "Config", "configure", "Configure"
Helpers.config
 
when "cal", "Cal", "calendar", "Calendar"
 puts "Calendar is not yet available."
  Helpers.cal
 
when "task", "Task"
 puts "Task is not yet available."
 Helpers.task
 
when "day", "Day"
 puts Time.now.strftime("%A")

when "deamon", "Deamon"
#puts "Deamon is not yet available."
Helpers.deamon

when "time", "Time"
 puts Jared.time
 
when "whatis", "Whatis"
 Helpers.define(ARGV[1])
 
when "whereis", "Whereis"
 if Uname.sysname.include?("Windows")
  puts "Function unavailable on Windows do to Launchy malfunctioning. Sorry :("
 else
  Helpers.map
 end
 
when "create", "Create"
 Helpers.create
 
when "weather", "Weather"
 Helpers.weather(ARGV[1])
 
when "mail", "Mail"
 Helpers.mail
  
else
 Helpers.notfound
end
