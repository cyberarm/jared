require "jared/plugin"

plugin=Jared::Plugin.new
  plugin.name = "Clock"
  plugin.description = "Shows a clock."
  plugin.author = "Cyberarm"
  plugin.homepage = "http://github.com/cyberarm/jared"
  plugin.sourcecode = "http://github.com/cyberarm/jared"
  plugin.command = "clock"
  plugin.usage = "clock"
  plugin.version = "0.4.0"
  plugin.main_require = "lib/clock"
  plugin.jared_version = "0.0.7a4"
  plugin.platform = :ruby

@@plugin = plugin