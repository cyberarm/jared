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
 loop do
  keypress do |a|
   if a == "\n"
    Shoes.app do
     title "Jared Services"
     para "something"
     list do
      end
     end
    end
   end
   sleep(0.1)
  end
 end
 
 def self.notfound
  puts "Error: Command '#{ARGV[0]}' not found."
  puts "Time - 04:12pm"
  puts "Date - Tuesday the 22nd of December 2012"
  puts "calc - 22 / 2"
 end
end
