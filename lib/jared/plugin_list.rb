module Jared
  class PluginList
    def initialize
      @file = "#{Dir.home}/.jared/data/plugins_list.json"
    end

    def fetch
      # list = open('https://raw.githubusercontent.com/cyberarm/jared-plugins/master/jared-plugins.json')
      # File.open(@file, 'w') {|file| file.write list}
    end

    def parse
      MultiJson.load(@file)
    end
  end
end
