# -*- encoding: utf-8 -*-
#
require File.expand_path("../lib/access_token/version", __FILE__)

excluded_dirs = ['pkg'].freeze

Gem::Specification.new do |s|
  s.name               = "access_token"
  s.version            = AccessToken::VERSION.dup
  s.authors            = ["doug sparling"]
  s.email              = ["doug.sparling@gmail.com"]
  s.description        = "Create and check simple time-based access token"
  s.summary            = "Create and check simple time-based access token"
  s.email              = ["doug.sparling@gmail.com"]
  s.homepage           = "https://github.com/dsparling/access_token"
  s.default_executable = "generate_token.rb"
  s.executables = ["generate_token.rb"]

  files = `git ls-files`.split "\n"
  excluded_dirs.each{ |d| files = files.find_all{ |f| !f.start_with? d } }

  s.files         = files
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency('rspec')
  s.add_development_dependency('simplecov')
end
