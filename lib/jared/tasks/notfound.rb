class Helpers
 # Lists available commands.
 def self.notfound
  puts "Error: Command '#{ARGV[0]}' not found."
  puts "Hi, Hello -  Jared Hi -Morning, #{Etc.getlogin}"
  puts "Create - Jared Create file index.html - Creates a File/Folder at curent location."
  puts "Time - Jared Time - 04:12pm"
  puts "Date - Jared Date - Tuesday the 22nd of December 2012"
  #puts "calc(ulator) - Jared Calc 22 / 2 - 11"
  puts "Task - Jared task - Opens a window listing tasks."
  puts "View - Jared View lib/lib.rb - Opens a file(e.g. Picture, document) in the system viewer."
  puts "Whereis - Jared Whereis -  Opens the system default browser to Gmaps."
 end
end