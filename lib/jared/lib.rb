# Lib file loads all Action and ActiveRecord Models.

require 'sqlite3'
require 'active_record'
unless File.exist?("#{Dir.home}/.jared.sqlite3")
puts "Setting up database."
ActiveRecord::Base.establish_connection(:adapter => 'sqlite3', :database => "#{Dir.home}/.jared.sqlite3")
ActiveRecord::Migration.verbose = false

 # Create Database table for Tasks
 ActiveRecord::Schema.define do
  create_table :tasks do |t|
   t.column :title, :string
   t.column :desciption, :string
   t.column :due, :datetime
   t.timestamps
  end
 end

 # Create table table for Ifos
 ActiveRecord::Schema.define do
  create_table :musics do |t|
   t.column :status, :string
   t.column :now_playing, :string
   t.column :now_playing_album, :string
   t.column :album_image, :string
   t.column :now_playing_author, :string
   t.column :author_url, :string
   t.column :music_url, :string
   t.column :album_url, :string
   t.timestamps
  end
 end

 # Create Database table for User
 ActiveRecord::Schema.define do
  create_table :users do |t|
   t.column :name, :string
   t.column :zip, :string
   t.column :mail_username, :string
   t.column :mail_password, :string
   t.column :mail_provider,  :string
   t.column :music,  :string
   t.timestamps
  end
 end
end

class Lib
# ActiveRecord DataBase connect
 def self.db
   ActiveRecord::Base.establish_connection(:adapter => 'sqlite3', :database => "#{Dir.home}/.jared.sqlite3")
 end
end

# Model files required
require_relative 'models/music.rb'
require_relative 'models/task.rb'
require_relative 'models/user.rb'
