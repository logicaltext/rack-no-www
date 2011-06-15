# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rack/no-www/version"

Gem::Specification.new do |s|
  s.name        = "rack-no-www"
  s.version     = Rack::NoWWW::VERSION
  s.authors     = ["logicaltext"]
  s.email       = ["logicaltext@logicaltext.com"]
  s.homepage    = "http://github.com/logicaltext/rack-no-www"
  s.summary     = "Rack middleware for redirecting 'www' requests"
  s.description = "Rack middleware for redirecting 'www' requests, " \
                  "based on the original idea by trevorturk "\
                  "(http://trevorturk.com/2009/11/05/no-www-rack-middleware/)."

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "rack-no-www"

  s.add_development_dependency "rspec", "~> 2.0"
  s.add_development_dependency "rack-test"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]
end
