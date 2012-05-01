# Lib file loads all Helpers

path = Gem::Specification.find_by_name("jared")
Dir["#{path.gem_dir}/helpers/*.rb"].each {|file| require file }
#Dir[File.dirname(__FILE__) + '/helpers/*.rb'].each {|file| require file }
