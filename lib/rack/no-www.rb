require 'rack/no-www/version.rb'

module Rack
  class NoWWW

    STARTS_WITH_WWW = /^www\./i

    def initialize(app)
      @app = app
    end

    def call(env)
      if env['HTTP_HOST'] =~ STARTS_WITH_WWW
        url = given_url(env)
        new_url = remove_www(url)

        puts "[Rack::NoWWW] #{url} -> #{new_url}"

        [301, headers(new_url), ["Moved Permanently\n"]]
      else
        @app.call(env)
      end
    end

    private
    def headers(new_url)
      { 'Location' => new_url, 'Content-Type' => 'text/html' }
    end

    def given_url(env)
      Rack::Request.new(env).url
    end

    def remove_www(url)
      url.sub(/www\./i, '')
    end

  end
end
