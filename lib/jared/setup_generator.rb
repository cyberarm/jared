module Jared
  class SetupGenerator
    def setup_directories
      create_jared_directory
      create_logger_directory
      create_data_directory
      create_plugins_directory
    end

    # Jared lives here
    def create_jared_directory
      if File.exists?("#{Dir.home}/.jared") && File.directory?("#{Dir.home}/.jared")
      else
        Dir.mkdir("#{Dir.home}/.jared")
      end
    end

    # Jared writes his logs here
    def create_logger_directory
      if File.exists?("#{Dir.home}/.jared/logs") && File.directory?("#{Dir.home}/.jared/logs")
      else
        Dir.mkdir("#{Dir.home}/.jared/logs")
      end
    end

    # Jared stores various data here
    def create_data_directory
      if File.exists?("#{Dir.home}/.jared/data") && File.directory?("#{Dir.home}/.jared/data")
      else
        Dir.mkdir("#{Dir.home}/.jared/data")
      end
    end

    # plugins store their data here
    def create_plugins_directory
      if File.exists?("#{Dir.home}/.jared/plugins") && File.directory?("#{Dir.home}/.jared/plugins")
      else
        Dir.mkdir("#{Dir.home}/.jared/plugins")
      end
    end
  end
end
