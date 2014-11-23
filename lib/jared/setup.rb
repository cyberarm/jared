require_relative "setup_generator"
require_relative "plugin_list"

Jared::SetupGenerator.new.setup_directories
Jared::PluginList.new.fetch
