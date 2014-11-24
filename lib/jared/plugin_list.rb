module Jared
  class PluginList
    def initialize
      @file = "#{Dir.home}/.jared/data/jared-plugins.json"
    end

    def fetch
      list = open('https://raw.githubusercontent.com/cyberarm/jared-plugins/master/jared-plugins.json').read
      File.open(@file, 'w') {|file| file.write list}
    end

    def parse
      MultiJson.load(File.open(@file).read)
    end
  end
end
