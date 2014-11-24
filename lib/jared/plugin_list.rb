module Jared
  class PluginList
    def initialize
      @file = "#{Dir.home}/.jared/data/jared-plugins.json"
    end

    def fetch
      begin
        list = open('https://raw.githubusercontent.com/cyberarm/jared-plugins/master/jared-plugins.json').read
      rescue
        if File.exist?(@file)
          # We'll live.
        else
          puts "Connection error.\nCould not fetch jared-plugins.json from github.com.\n:("
          exit
        end

        File.open(@file, 'w') {|file| file.write list}
      end
    end

    def parse
      MultiJson.load(File.open(@file).read)
    end
  end
end
