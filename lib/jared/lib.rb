# Lib file loads all Helpers and Models.

class Lib
# ActiveRecord DataBase connect
 def self.db
  ActiveRecord::Base.establish_connection(:adapter => 'sqlite3', :database => "#{Dir.home}/.jared.sqlite3")
 end
end

#path = Gem::Specification.find_by_name("jared")

# Model files requires
#Dir["#{path.gem_dir}/lib/jared/models/*.rb"].each {|file| require file }
Dir[File.dirname(__FILE__) + '/models/*.rb'].each {|file| require file }

# Helper files requires
#Dir["#{path.gem_dir}/lib/jared/helpers/*.rb"].each {|file| require file }
Dir[File.dirname(__FILE__) + '/helpers/*.rb'].each {|file| require file }