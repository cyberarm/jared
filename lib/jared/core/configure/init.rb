require "jared/plugin"

plugin=Jared::Plugin.new
  plugin.name = "Configure"
  plugin.description = "Configure Jared."
  plugin.author = "Cyberarm"
  plugin.homepage = "http://github.com/cyberarm/jared"
  plugin.sourcecode = "http://github.com/cyberarm/jared"
  plugin.command = "config"
  plugin.usage = "config"
  plugin.version = "0.4.0"
  plugin.main_require = "lib/config"
  plugin.jared_version = "0.0.7a4"
  plugin.platform = :ruby

@@plugin = plugin