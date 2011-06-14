require 'rack/no-www/version.rb'

module Rack
  class NoWWW

    STARTS_WITH_WWW = /^www\./i

    def initialize(app)
      @app = app
    end

    def call(env)
      if env['HTTP_HOST'] =~ STARTS_WITH_WWW
        [301, no_www_request(env), ["Moved Permanently\n"]]
      else
        @app.call(env)
      end
    end

    private
    def no_www_request(env)
      { 'Location' => Rack::Request.new(env).url.sub(/www\./i, ''),
        'Content-Type' => 'text/html' }
    end

  end
end
