class Helpers
 def self.clock
  begin 
   require "green_shoes"
   Shoes.app width: 300,  height: 70, title: "Jared Clock" do
    @clock = stack do
     title "#{Time.now.strftime("%I:%M:%P")}"
    end
    every 0.5 do
     @clock.clear do
      title "#{Time.now.strftime("%I:%M:%S%P")}"
     end
    end
   end
  rescue LoadError
  end
 end
 
 def self.date
  if Time.now.strftime("%d") == "2"
   puts "#{Time.now.strftime("%A the %dnd of %B %Y")}"
  elsif Time.now.strftime("%d") == "22"
   puts "#{Time.now.strftime("%A the %dnd of %B %Y")}"
  elsif  Time.now.strftime("%d") == "3"
   puts "#{Time.now.strftime("%A the %drd of %B %Y")}"
  elsif Time.now.strftime("%d") == "33"
   puts "#{Time.now.strftime("%A the %drd of %B %Y")}"
  elsif Time.now.strftime("%d") == "1"
   puts "#{Time.now.strftime("%A the %dst of %B %Y")}"
  elsif Time.now.strftime("%d") == "21"
   puts "#{Time.now.strftime("%A the %dst of %B %Y")}"
  elsif Time.now.strftime("%d") == "31"
   puts "#{Time.now.strftime("%A the %dst of %B %Y")}"
  else
   puts "#{Time.now.strftime("%A the %dth of %B %Y")}"
  end
  puts "(#{Time.now.strftime("%m/%d/%Y")})"
 end
 
 def self.greeting
   if Time.now.strftime("%H").to_i < "04".to_i
  puts "Go tee bed."
 elsif Time.now.strftime("%H").to_i < "07".to_i
  puts "Yawn Zzzz"
 elsif Time.now.strftime("%H").to_i < "12".to_i
  puts "Morning, #{Etc.getlogin}"
 elsif Time.now.strftime("%H").to_i < "16".to_i
  puts "Afternoon, #{Etc.getlogin}"
 elsif Time.now.strftime("%H").to_i < "20".to_i
  puts "Evening, #{Etc.getlogin}"
 elsif Time.now.strftime("%H").to_i < "22".to_i
  puts "Ummm, good night, #{Etc.getlogin}"
  puts "Its getting late, consider getting some rest."
 elsif Time.now.strftime("%H").to_i < "24".to_i
  puts "Zzzz"
 end
 end
 
 def self.cal
  require "green_shoes"
  Shoes.app do
   title "Calendar Events"
   events = ["Sidney", "Call Bob"]
   events.each do |e|
    para e
   end
  end
 end
 
 def self.calc(a, b, c)
 puts "Calc(ulator) is not yet available."#a.to_i b.to_i c.to_i
  case ARGV[2]
   when "jared"
    puts "multiplication is broken"
    puts ARGV[1].to_f * ARGV[3].to_f
   when "+"
    puts ARGV[1].to_i + ARGV[3].to_i
   when "-"
    puts ARGV[1].to_f - ARGV[3].to_f
   when "/"
    puts ARGV[1].to_f / ARGV[3].to_f
   end
 end
 
 def self.deamon
 end
 
 def self.task
 ActiveRecord::Base.establish_connection(
 :adapter => 'sqlite3',
 :database => "#{Gem.loaded_specs['jared'].full_gem_path}/.jared.sqlite3")
  require "green_shoes"
  require_relative "models/task.rb"
  Shoes.app title: "Jared Tasks" do
   title "Tasks"
      button "add task" do
     Shoes.app  title: "Add Task", width: 250, height: 400 do
      title "add task"
       stack do
        para "Task title:"
         @title = edit_line text: ""
        para "Task desciption:"
         @desciption = edit_box text: ""
        para "Task due date:"
         @due = edit_line text: ""
        button "Add Task" do
         new_task = Task.new(:title => @title.text, :desciption => @desciption.text, :due => @due.text)
         new_task.save!
         if new_task
          alert "added task"
          close
         else
          alert "failed to add task. Make sure you use a unique title"
         end
        end
       end
      end
      end
       button "Refresh" do
         $tasks_s.clear do
          $tasks_s = stack do
           task = Task.find(:all) 
           task.each do |t|
            tagline t.title
            tagline "Desciption:"
            para t.desciption
            tagline "Due:"
            para t.due
            flow do
            button "Edit", state: "nil" do
             Shoes.app  title: "Editing Task: #{t.title}", width: 250, height: 400 do
             title "edit task"
              stack do
               para "Task title:"
                @title = edit_line text: "#{t.title}"
               para "Task desciption:"
                @desciption = edit_box text: "#{t.desciption}"
               para "Task due date:"
                @due = edit_line text: "#{t.due}"
               button "update Task" do
                task = Task.find(t.id)
                @edit_task = task.update_attributes(:title => @title.text, :desciption => @desciption.text, :due => @due.text)
                close
               end
              end
             end
            end
            button "Delete" do
              delete = confirm "Deleting... Are you sure?"
              if delete == true
               Task.destroy(t.id)
               alert "removed #{t.title}" 
              end
            end
            para
           end
          end
         end
         end
        end
    task = Task.find(:all)
    $tasks_s = stack do
    task.each do |t|
     tagline t.title
     tagline "Desciption:"
     para t.desciption
     tagline "Due:"
     para t.due
     flow do
     button "Edit", state: "nil" do
      Shoes.app  title: "Editing Task: #{t.title}", width: 250, height: 400 do
      title "edit task"
       stack do
        para "Task title:"
         @title = edit_line text: "#{t.title}"
        para "Task desciption:"
         @desciption = edit_box text: "#{t.desciption}"
        para "Task due date:"
         @due = edit_line text: "#{t.due}"
        button "update Task" do
         task = Task.find(t.id)
         @edit_task = task.update_attributes(:title => @title.text, :desciption => @desciption.text, :due => @due.text)
         close
        end
       end
      end
     end
     button "Delete" do
       delete = confirm "Deleting... Are you sure?"
       if delete == true
        Task.destroy(t.id)
        alert "removed #{t.title}" 
       end
     end
     para
    end
   end  
  end
  end
  end
 
 def self.create
   begin
   if ARGV[1].include?("folder")
    FileUtils.mkdir "#{ARGV[2]}"
    puts "New Folder is at: #{Dir.pwd}/#{ARGV[2]}"
   elsif ARGV[1].include?("dir")
    FileUtils.mkdir "#{ARGV[2]}"
    puts "New Directory is at: #{Dir.pwd}/#{ARGV[2]}"
   elsif ARGV[1].include?("file")
    File.open("#{ARGV[2]}", 'w') do |file|
     file.puts "Hello World"
    end
    puts "New file is at: #{Dir.pwd}/#{ARGV[2]}"
   else
    puts "Don't know how-to create that."
   end
   rescue NoMethodError
     puts "Folder/File name can't be blank."
  end
 end
 
 def self.define(word)
  puts "this function is unavailable. Word: #{word}"
 end
 
 def self.map
  print "search Gmaps for > "
  @m = STDIN.gets.chomp
  puts "Opening Gmaps in default browser."
  puts "#{@m}"
  Launchy.open("http://maps.google.com/?q=#{@m}")
 end
 
 def self.notfound
  puts "Error: Command '#{ARGV[0]}' not found."
  puts "Hi, Hello -  Jared Hi -Morning, #{Etc.getlogin}"
  puts "Create - Jared Create file index.html - Creates a File/Folder at curent location."
  puts "Time - Jared Time - 04:12pm"
  puts "Date - Jared Date - Tuesday the 22nd of December 2012"
  puts "calc(ulator) - Jared Calc 22 / 2 - 11"
  puts "Task - Jared task - Opens a window listing tasks."
  puts "View - Jared View lib/lib.rb - Opens a file(e.g. Picture, text, opendocument) in the system viewer."
  puts "Whereis - Jared Whereis -  Opens the system default browser to Gmaps."
 end
end
