class Helpers
Lib.db
 # Dynamically greets the user by time when <em>jared hi/hello</em> is run.
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
end