require "jared/plugin"

plugin=Jared::Plugin.new
  plugin.name = "Jamendo"
  plugin.description = "Streams prefered music from Jamendo. Experimental."
  plugin.author = "Cyberarm"
  plugin.author_email = "matthewlikesrobots@gmail.com"
  plugin.homepage = "http://github.com/cyberarm/jared-core-plugins"
  plugin.sourcecode = "http://github.com/cyberarm/jared-core-plugins"
  plugin.command = "jamendo"
  plugin.arguments = "ACTION"
  plugin.usage = "jamendo play", "Now playing: title, by: composer (1 minute 30 seconds)"
  plugin.version = "0.4.0"
  plugin.main_require = "lib/jamendo"
  plugin.jared_version = "0.0.7a4"
  plugin.platform = :ruby

@@plugin = plugin