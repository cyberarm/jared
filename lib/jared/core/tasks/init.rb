require "jared/plugin"

Jared::Plugin.config do |plugin|
  plugin.name = "Tasks"
  plugin.description = "Manage tasks."
  plugin.author = "Cyberarm"
  plugin.homepage = "http://github.com/cyberarm/jared"
  plugin.sourcecode = "http://github.com/cyberarm/jared"
  plugin.command = "tasks"
  plugin.usage = "tasks"
  plugin.version = "0.4.0"
  plugin.main_require = "lib/task"
  plugin.jared_version = "0.0.7a4"
  plugin.platform = :ruby
end