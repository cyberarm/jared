#!/bin/ruby
require "faster_require"
require 'etc'
require "fileutils"
require 'sqlite3'
require 'active_record'
require 'sys/uname'
 include Sys

unless File.exist?("#{Dir.home}/.jared.sqlite3")
puts "Setting up database."
ActiveRecord::Base.establish_connection(:adapter => 'sqlite3', :database => "#{Dir.home}/.jared.sqlite3")
ActiveRecord::Migration.verbose = false

 ActiveRecord::Schema.define do
  create_table :tasks do |t|
   t.column :title, :string
   t.column :desciption, :string
   t.column :due, :string
   t.timestamps
  end
 end

 ActiveRecord::Schema.define do
  create_table :users do |t|
   t.column :name, :string
   t.column :zip, :string
   t.column :mail_username, :string
   t.column :mail_password, :string
   t.column :mail_provider,  :string
   t.timestamps
  end
 end
end

require_relative "jared/lib.rb"
#require "jared/lib"
Lib.db
if User.first.blank?
 new_user = User.new(:name => "#{Etc.getlogin}", :zip => "10001")
 c=confirm "Setup Jared?"
 if c == true
  Helpers.config
 else
 end
end

require_relative "jared/jared.rb"
