require "jared/plugin"

plugin=Jared::Plugin.new
  plugin.name = "Google Maps"
  plugin.description = "Shows a clock."
  plugin.author = "Cyberarm"
  plugin.homepage = "http://github.com/cyberarm/jared"
  plugin.sourcecode = "http://github.com/cyberarm/jared"
  plugin.command = "map"
  plugin.usage = "map 'location, io'"
  plugin.version = "0.4.0"
  plugin.main_require = "lib/map"
  plugin.jared_version = "0.0.7a4"
  plugin.platform = :ruby

@@plugin = plugin