class Action
  class Create
    # Creates a File or Folder.
    #
    # Usage:
    #
    # <em>jared create file/folder/dir</em>
    def create
      if defined?(ARGV[1].length)
        begin
          if ARGV[1].downcase == "folder"
            FileUtils.mkdir "#{ARGV[2]}"
            puts "New Folder is at: #{Dir.pwd}/#{ARGV[2]}"
          elsif ARGV[1].downcase == "dir"
            FileUtils.mkdir "#{ARGV[2]}"
            puts "New Directory is at: #{Dir.pwd}/#{ARGV[2]}"
          elsif ARGV[1].downcase == "file"
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
  end
end

Action::Create.new.create