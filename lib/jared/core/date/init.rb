require "jared/plugin"

Jared::Plugin.config do |plugin|
  plugin.name = "Date"
  plugin.description = "Shows current date."
  plugin.author = "Cyberarm"
  plugin.homepage = "http://github.com/cyberarm/jared"
  plugin.sourcecode = "http://github.com/cyberarm/jared"
  plugin.command = "date"
  plugin.usage = "date"
  plugin.version = "0.4.0"
  plugin.main_require = "lib/date"
  plugin.jared_version = "0.0.7a4"
  plugin.platform = :ruby
end