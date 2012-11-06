require "jared/plugin"

plugin=Jared::Plugin.new
  plugin.name = "Stock"
  plugin.description = "Fetches stock data, from source."
  plugin.author = "Cyberarm"
  plugin.author_email = "matthewlikesrobots@gmail.com"
  plugin.homepage = "http://github.com/cyberarm/jared-core-plugins"
  plugin.sourcecode = "http://github.com/cyberarm/jared-core-plugins"
  plugin.command = "stock"
  plugin.arguments = "SYMBOL"
  plugin.usage = "stock dct", "Stock data for: DCT Industrial Trust Inc.\n6.38"
  plugin.version = "0.4.0"
  plugin.main_require = "lib/stock"
  plugin.jared_version = "0.0.7a4"
  plugin.platform = :ruby

@@plugin = plugin