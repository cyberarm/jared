#!/bin/ruby
s=Time.now
require "json"
require 'logger'
require "open-uri"
require 'fileutils'
require 'versionomy'
require_relative 'jared/version'

if File.exists?("#{Dir.home}/.jared") && File.directory?("#{Dir.home}/.jared")
else
  FileUtils.mkdir("#{Dir.home}/.jared")
end

if File.exists?("#{Dir.home}/.jared/logs") && File.directory?("#{Dir.home}/.jared/logs")
else
  FileUtils.mkdir("#{Dir.home}/.jared/logs")
end

if File.exists?("#{Dir.home}/.jared/db") && File.directory?("#{Dir.home}/.jared/db")
else
  FileUtils.mkdir("#{Dir.home}/.jared/db")
end

if File.exists?("#{Dir.home}/.jared/plugins") && File.directory?("#{Dir.home}/.jared/plugins")
else
  FileUtils.mkdir("#{Dir.home}/.jared/plugins")
end

require_relative "jared/logg"
include Logg

log.info "Loaded logger."
log.info "Using Jared version: #{Jared::VERSION}"
Thread.new do
  info=open("http://rubygems.org/api/v1/gems/jared.json").read
  json=JSON.parse(info)
  current_version = Versionomy.parse(Jared::VERSION)

  web_version = Versionomy.parse(json['version'])
  if current_version < web_version
    log.info "A new version of Jared is available on RubyGems."
    puts "A new version of Jared is available on RubyGems."
  end
end

require_relative "jared/database"
log.info "Loading Database..."
Lib.db
log.info "Loaded Database."

require_relative "jared/plugins"
log.info "Loading plugins..."
@plugins=Plugins::Load.new.load_all
log.info "Loaded plugins."

if User.first.blank?
  require 'green_shoes'
  new_user = User.new(:name => "#{Etc.getlogin}", :zip => "10001", :music => 'classical')
  log.info "Creating new user: #{new_user.inspect}"
  new_user.save
  log.info "Created new user: #{new_user.inspect}"
  c=confirm "Setup Jared?\nSetting up Jared will enable it\n to retrieve personalized data for you."
  if c == true
    require 'jared/core/config'
    Action::Configure.new.config
  else
    alert "Run: 'jared config' to setup later."
    log.info "Skipped initial setup."
  end
end

if Music.first.blank?
  jrd = Music.new(:status => "Ready", :now_playing => "", :now_playing_author => "")
  jrd.save
  if jrd
  else
    log.error 'Failed to create Music!'
  end
end

f=Time.now
@load_time = f-s
log.info "Main dependencies took #{@load_time} seconds to load."

require_relative "jared/jared"