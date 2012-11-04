module Jared
  class Plugin
    attr_accessor :name
    attr_accessor :description
    attr_accessor :author
    attr_accessor :author_email
    attr_accessor :homepage
    attr_accessor :sourcecode
    attr_accessor :command
    attr_accessor :arguments
    attr_accessor :usage
    attr_accessor :main_require
    attr_accessor :platform
    attr_accessor :version
    attr_accessor :jared_version

    def self.version
      "1.0.0"
    end
  end
end