class Helpers
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
end