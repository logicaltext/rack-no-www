require File.expand_path("../lib/rack/no-www/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "rack-no-www"
  s.version     = Rack::NoWWW::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["logicaltext"]
  s.email       = ["logicaltext@logicaltext.com"]
  s.homepage    = "http://github.com/logicaltext/rack-no-www"
  s.summary     = "Rack middleware for redirecting 'www' requests"
  s.description = "Rack middleware for redirecting 'www' requests, " \
                  "based on the original idea by trevorturk "\
                  "(http://trevorturk.com/2009/11/05/no-www-rack-middleware/)."

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "rack-no-www"

  s.files        = Dir[ 'lib/**/*', 'LICENSE']
  s.require_path = 'lib'

end
