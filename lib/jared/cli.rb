module Jared
  class CLI < Thor
    desc 'version', "shows version"
    def version
      puts "Jared version #{Jared::VERSION}"
    end

    Jared::PluginList.new.parse['plugins'].each do |plugin|
      desc plugin['command'], plugin['description']
      define_method plugin['command'] do |*args|
        require plugin['rubygem_name'] if plugin['rubygem']
        args, opts = Thor::Arguments.split(args)
        invoke Module.const_get(plugin['main_class']), args, opts, :invoked_via_subcommand => true
      end
    end
  end
end
