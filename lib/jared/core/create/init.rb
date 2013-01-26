require "jared/plugin"

Jared::Plugin.config do |plugin|
  plugin.name = "Create"
  plugin.description = "Create files and folders, as well as project skeleton files."
  plugin.author = "Cyberarm"
  plugin.homepage = "http://github.com/cyberarm/jared"
  plugin.sourcecode = "http://github.com/cyberarm/jared"
  plugin.command = "create"
  plugin.usage = "create folder infos_project"
  plugin.arguments = "TYPE, NAME"
  plugin.version = "0.4.0"
  plugin.main_require = "lib/create"
  plugin.jared_version = "0.0.7a4"
  plugin.platform = :ruby
end