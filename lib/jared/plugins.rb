require 'set'
require_relative "plugin"
# require 'jared/version'
class Plugins
  PLUGINS=Set.new
  PATH="#{Dir.home}/.jared/plugins"
  class Load
    include Logg
    def initialize(path='')
      @path=path
    end

    def load(path)
      count=0
      Dir.glob("#{path}/*").select do |file|
        if File.directory?(file)
          next
        elsif file.include?("init.rb")
          require_relative "#{file}"
        else
          next
        end
        plugin=Jared::Plugin.configuration
        log.info "Plugin path: #{file}"
        begin
          if plugin.name.nil? or plugin.name == ""
            raise raise ArgumentError, "Plugin Name for #{file.gsub("#{path}", '')} is not defined or is blank!"
          elsif plugin.command.nil? or plugin.command == ""
            raise ArgumentError, "Plugin Command for #{file.gsub("#{path}", '')} is not defined or is blank!"
          elsif plugin.platform.nil? or plugin.platform == ""
            raise ArgumentError, "Plugin Platform for #{file.gsub("#{path}", '')} is not defined or is blank!"
          elsif plugin.main_require.nil? or plugin.main_require == ""
            raise ArgumentError, "Plugin Main_Require for #{file.gsub("#{path}", '')} is not defined or is blank!"
          end
        rescue => e
          log.error e
          next
        end
        count+=1
        data={
          dir: file.sub("init.rb",''),
          name: plugin.name,
          description: plugin.description,
          author: plugin.author,
          author_email: plugin.author_email,
          homepage: plugin.homepage,
          sourcecode: plugin.sourcecode,
          command: plugin.command,
          arguments: plugin.arguments,
          usage: plugin.usage,
          main_require: plugin.main_require,
          jared_version: plugin.jared_version
        }
        if plugin.jared_version == Jared::VERSION && plugin.platform == :ruby
          a=PLUGINS.add?(data)
          if a
            log.info "Loaded: #{plugin.name}"
          end
        elsif RUBY_PLATFORM.include?(plugin.platform.to_s)
          a=PLUGINS.add?(data)
          if a
            log.info "Loaded: #{plugin.name}"
          end
        else
          log.warn "Could not load plugin: #{plugin.name}. Reason: Version mismatch."
        end
      end
    end

    def load_core
      spec=Gem::Specification.find_by_name("jared")
      load("#{spec.gem_dir}/lib/jared/core/*")
    end

    def load_all
      load_core
      load(PATH)
      return PLUGINS
    end
  end

  # This class contains code for installing plugins.
  class Get
    include Logg
    def initialize
    end
  end

  class List
    include Logg
  end
end