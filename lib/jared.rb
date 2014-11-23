require "thor"
require "logger"
require "multi_json"
require "open-uri"
require_relative 'jared/version'
require_relative 'jared/setup'
require_relative 'jared/plugin_list'
require_relative 'jared/logg'
require_relative 'jared/cli'

Jared::CLI.start(ARGV)
