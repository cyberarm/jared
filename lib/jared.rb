#!/bin/ruby
s=Time.now
require "json"
require 'logger'
require "open-uri"
require_relative 'jared/version'

if File.exists?("#{Dir.home}/.jared") && File.directory?("#{Dir.home}/.jared")
else
  Dir.mkdir("#{Dir.home}/.jared")
end

if File.exists?("#{Dir.home}/.jared/logs") && File.directory?("#{Dir.home}/.jared/logs")
else
  Dir.mkdir("#{Dir.home}/.jared/logs")
end

if File.exists?("#{Dir.home}/.jared/data") && File.directory?("#{Dir.home}/.jared/data")
else
  Dir.mkdir("#{Dir.home}/.jared/data")
end

if File.exists?("#{Dir.home}/.jared/plugins") && File.directory?("#{Dir.home}/.jared/plugins")
else
  Dir.mkdir("#{Dir.home}/.jared/plugins")
end

require_relative "jared/logg"
include Logg

log.info "Loaded logger."
log.info "Using Jared version: #{Jared::VERSION}"

f=Time.now
@load_time = f-s
log.info "Main dependencies took #{@load_time} seconds to load."

require_relative "jared/jared"
