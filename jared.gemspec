# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "jared/version"

Gem::Specification.new do |s|
  s.name = "jared"
  s.version = Jared::VERSION
  s.authors = ["Cyber"]
  s.email = ["matthewlikesrobots@gmail.com"]
  s.homepage = "https://github.com/cyberarm/jared"
  s.summary = "Ruby powered digital assistant"
  s.description = "Ruby powered digital assistant"

  s.rubyforge_project = "jared"

  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib", "bin"]

  # s.add_development_dependency ""
  s.add_runtime_dependency "green_shoes"
  s.add_runtime_dependency "gstreamer"
  s.add_runtime_dependency "thor"
  s.add_runtime_dependency "chronic"
  s.add_runtime_dependency "sys-uname"
  s.add_runtime_dependency "activerecord"
  s.add_runtime_dependency "sqlite3"
  s.add_runtime_dependency "launchy"
  s.add_runtime_dependency 'google-weather'
  s.add_runtime_dependency 'gmail'
  s.add_runtime_dependency 'gibberish'
  s.add_runtime_dependency 'faster_require'
  s.add_runtime_dependency 'json'
end