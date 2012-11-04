require 'set'
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
      require_relative "#{PATH}/#{@path}/init"
      plugin=@@plugin
      log.info "Loaded: #{@plugin.name}"
      PLUGINS << plugin
      p PLUGINS
    end

    def all
      count=0
      Dir.glob("#{PATH}/*").select do |file|
        require_relative "#{file}/init.rb"
        plugin=@@plugin
        log.info "Plugin path: #{file}"
        begin
          if plugin.name.nil? or plugin.name == ""
            raise raise ArgumentError, "Plugin Name for #{file.gsub("#{PATH}", '')} is not defined or is blank!"
          elsif plugin.command.nil? or plugin.command == ""
            raise ArgumentError, "Plugin Command for #{file.gsub("#{PATH}", '')} is not defined or is blank!"
          elsif plugin.platform.nil? or plugin.platform == ""
            raise ArgumentError, "Plugin Platform for #{file.gsub("#{PATH}", '')} is not defined or is blank!"
          elsif plugin.main_require.nil? or plugin.main_require == ""
            raise ArgumentError, "Plugin Main_Require for #{file.gsub("#{PATH}", '')} is not defined or is blank!"
          end
        rescue => e
          log.error e
          next
        end
        count+=1
        data={name: plugin.name,
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
        if plugin.jared_version == VERSION && plugin.platform == :ruby
          a=PLUGINS.add?(data)
          if a
            log.info "Loaded: #{plugin.name}"
            log.info "Plugin count: #{count}"
          end
        else
          log.warn "Could not load plugin: #{file.gsub("#{PATH}", '')}"
        end
      end
      PLUGINS
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