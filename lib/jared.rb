#!/bin/ruby
s=Time.now
require 'faster_require'
require 'logger'

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

@log=Logger.new("#{Dir.home}/.jared/#{Time.new.strftime('%I-%M-%S')}-debug.log")
@log.info "Loaded logger."

require_relative "jared/database.rb"
Lib.db
if User.first.blank?
  require 'green_shoes'
  new_user = User.new(:name => "#{Etc.getlogin}", :zip => "10001", :music => 'classical')
  new_user.save
  c=confirm "Setup Jared?\nSetting up Jared will enable it to retrieve personalized data for you."
  if c == true
    require 'jared/core/config'
    Action::Configure.new.config
  else
    alert "Run: 'jared config' to setup later."
  end
end

if Music.first.blank?
  jrd = Music.new(:status => "Ready", :now_playing => "", :now_playing_author => "")
  jrd.save
  if jrd
    puts 'Ready.'
  else
    puts 'Failed to create Music!'
  end
end

f=Time.now
@load_time = f-s
@log.info "Main dependencies took #{@load_time} seconds to load."

require_relative "jared/jared"