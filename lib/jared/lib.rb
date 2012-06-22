# Lib file loads all Helpers and Models.

class Lib
# ActiveRecord DataBase connect
 def self.db
  ActiveRecord::Base.establish_connection(:adapter => 'sqlite3', :database => "#{Dir.home}/.jared.sqlite3")
 end
end

# Model files requires
require_relative 'models/info.rb'
require_relative 'models/task.rb'
require_relative 'models/user.rb'
