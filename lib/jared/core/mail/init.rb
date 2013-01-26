require "jared/plugin"

Jared::Plugin.config do |plugin|
  plugin.name = "Gmail"
  plugin.description = "Check you Gmail for new messages."
  plugin.author = "Cyberarm"
  plugin.homepage = "http://github.com/cyberarm/jared"
  plugin.sourcecode = "http://github.com/cyberarm/jared"
  plugin.command = "mail"
  plugin.usage = "mail"
  plugin.version = "0.4.0"
  plugin.main_require = "lib/mail"
  plugin.jared_version = "0.0.7a4"
  plugin.platform = :ruby
end