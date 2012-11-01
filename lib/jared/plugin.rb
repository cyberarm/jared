class Jared
  class Plugin
    attr_writer :plugin_id, :plugin_name, :plugin_description, :plugin_command, :plugin_arguments, :plugin_usage, :plugin_main_require
    def initialize
      @plugin_id=1234567890
      @plugin_name=""
      @plugin_description=""
      @plugins_command=""
      @plugins_arguments=""
      @plugin_usage_example=""
      @plugin_main_require=""
    end

    def plugin_id
      @plugin_id
    end

    def plugin_name
      @plugin_name
    end

    def plugin_description
      @plugin_description
    end

    def plugins_arguments
      @plugins_arguments
    end

    def plugin_usage_example
      @plugin_usage_example
    end

    def plugin_main_require
      @plugin_main_require
    end

    def self.version
      "1.0.0"
    end
  end
end