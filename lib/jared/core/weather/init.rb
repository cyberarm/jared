require "jared/plugin"

Jared::Plugin.config do |plugin|
  plugin.name = "Weather"
  plugin.description = "Fetches weather data."
  plugin.author = "Cyberarm"
  plugin.author_email = "matthewlikesrobots@gmail.com"
  plugin.homepage = "http://github.com/cyberarm/jared-core-plugins"
  plugin.sourcecode = "http://github.com/cyberarm/jared-core-plugins"
  plugin.command = "weather"
  plugin.arguments = "FORECAST"
  plugin.usage = "weather 10001", "D"
  plugin.version = "0.4.0"
  plugin.main_require = "lib/weather"
  plugin.jared_version = "0.0.7a4"
  plugin.platform = :ruby
end