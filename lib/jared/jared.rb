require 'thor'
  class Jared < Thor
    default_tasks :hi

    desc "server", "Dynamic greeting based on the current time."
    def server
      require 'drb'
      require_relative 'drb/drb_server.rb'
      Helpers::Drb.start_server
    end

    desc "hi", "Dynamic greeting based on the current time."
    def hi
      require_relative 'tasks/greeting.rb'
      Task::Greet.new.greet
    end

    desc "time", "Gets the current time."
    def time
      puts "#{Time.now.strftime("%I:%M:%S%P")}"
    end

    desc "weather [FORECAST]", "Gets weather information, If no argument then returns current weather information."
    def weather(option=nil)
      require_relative 'tasks/weather.rb'
      require 'weatherboy'
      require 'area'
      Task::Weather.new.weather(option)
    end

    desc "clock", "Open a Green Shoes powered clock."
    def clock
      require_relative 'tasks/clock.rb'
      require 'green_shoes'
      Task::Clock.new.clock
    end

    desc "create TYPE NAME", "create"
    def create(type,name)
      require_relative 'tasks/create.rb'
      Task::Create.new.create
    end

    desc "whereis PLACE", "Finds PLACE via Google Maps"
    def whereis(place)
      require_relative 'tasks/map.rb'
      require 'launchy'
      Task::Map.new.map(place)
    end

    desc "day", "Displays the current day"
    def day
      puts Time.now.strftime("%A")
    end

    desc "whatis WORD", "Looks up the meaning of WORD."
    def whatis(word)
      require_relative 'tasks/define.rb'
      Task::Word.new.define(word)
    end

    desc "deamon MAIL/TASK/CAL", "Checks every minute for new mail/taskss/appointments."
    def deamon(function=nil)
      require_relative 'tasks/deamon.rb'
      require 'gmail'
      require 'gibberish'
      Task::Daemon.new.deamon
    end

    desc "jamendo MODE", "Plays music from Jamendo."
    def jamendo(mode='play')
      require_relative 'tasks/jamendo.rb'
      Task::Jamendo.new.jamendo(mode)
    end

    desc "play FILE", "Plays File, local or remote."
    def play(media='')
      require_relative 'tasks/player.rb'
      Task::Player.new.play(media)
    end

    desc "tasks", "Manage your Tasks"
    def tasks
      require 'green_shoes'
      require 'chronic'
      require_relative 'tasks/tasks.rb'
      puts "Task is not yet available."
      begin
        Task::Tasks.new.tasks
      rescue => e
        p e
      end
    end

    desc "config", "Configure Jared."
    def config
      require_relative 'tasks/config.rb'
      require 'green_shoes'
      require 'gibberish'
      Task::Configure.new.config
    end

    desc "view FILENAME", "View file.png in system viewer."
    def view(filename)
      require 'sys/uname'
      include Sys
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
      require_relative 'tasks/date.rb'
      Task::Date.new.date
    end

    # desc "cal", "Calendar"
    # def cal
    #   puts "Calendar is not yet available."
    #   #require 'green_shoes'
    #   #Helpers.cal
    # end

    desc "mail", "Checks your mailbox for new mails."
    def mail
      require_relative 'tasks/mail.rb'
      require 'gmail'
      require 'gibberish'
      Task::Mail.new.mail
    end

    desc "stock SYMBOL MODE", "Check semi-current stock data."
    def stock(s,m='last')
      require_relative 'tasks/stock.rb'
      Task::Stock.new.stock(s,m)
    end
  end

Jared.start