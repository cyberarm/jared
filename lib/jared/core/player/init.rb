require "jared/plugin"

plugin=Jared::Plugin.new
  plugin.name = "Player"
  plugin.description = "Shows a clock."
  plugin.author = "Cyberarm"
  plugin.homepage = "http://github.com/cyberarm/jared"
  plugin.sourcecode = "http://github.com/cyberarm/jared"
  plugin.command = "play"
  plugin.usage = "play 'file or url'"
  plugin.version = "0.4.0"
  plugin.main_require = "lib/player"
  plugin.jared_version = "0.0.7a4"
  plugin.platform = :mingw32

@@plugin = plugin