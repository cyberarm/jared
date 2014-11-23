module Jared
  class CLI < Thor
    desc 'version', "shows version"
    def version
      puts "Jared version #{Jared::VERSION}"
    end

    desc 'test', "test STUFF"
    def test(stuffs)
      puts "#{stuffs}"
    end

    Jared::PluginList.parse['plugins'].each do |plugin|
      desc plugin['command'], plugin['description']
      define_method plugin['command'] do
        subcommand plugin['command'], Module.const_get(plugin['main_class'].capitalize)
      end
    end
  end
end
