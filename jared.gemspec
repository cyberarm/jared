# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "jared/version"

Gem::Specification.new do |s|
  s.name = "jared"
  s.version = Jared::VERSION
  s.authors = ["cyberarm"]
  s.email = ["matthewlikesrobots@gmail.com"]
  s.homepage = "https://github.com/cyberarm/jared"
  s.summary = "Ruby powered digital assistant"
  s.description = "Ruby powered digital assistant"

  s.files = Dir["**/**/*.*"]# `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib", "bin"]

  s.add_runtime_dependency "multi_json"
  s.add_runtime_dependency "thor"
end
