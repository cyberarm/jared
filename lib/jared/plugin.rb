module Jared
  class Plugin
    def plugin name
      @plugin = name
    end

    def description string
      @description = string ||= ""
    end

    def version string
      @version = string
    end

    def jared_version string
      @jared_version = string
    end

    def rubygem boolean
      @rubygem = boolean ||= false
    end

    def rubygem_name string
      @rubygem_name = string ||= ""
    end

    def github boolean
      @github = boolean ||= false
    end

    def github_repo string
      @github_repo = string ||= ""
    end

    def ruby_platform string
      # ruby, cruby, jruby, or rbx
      @ruby_platform = string ||= "ruby"
    end

    def platform string
      # windows, linux, mac, unix, or a blank string for any platform.
      @platform = ""
    end
  end
end
