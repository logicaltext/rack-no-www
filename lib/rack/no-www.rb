require 'rack/no-www/version.rb'

module Rack
  class NoWWW

    STARTS_WITH_WWW = /^www\./i

    def initialize(app, options={})
      default_options = {
        only_hosts: []
      }

      @app = app
      @options = default_options.merge(options)
    end

    def call(env)
      if require_redirect?
        [301, no_www_request(env), ["Moved Permanently\n"]]
      else
        @app.call(env)
      end
    end

  private

    def require_redirect?
      env['HTTP_HOST'] =~ STARTS_WITH_WWW && host_match?
    end

    def host_match?
      @options[:only_hosts].include?(env['HTTP_HOST']) unless @options[:only_hosts].empty?
    end
  
    def no_www_request(env)
      { 'Location' => Rack::Request.new(env).url.sub(/www\./i, ''),
        'Content-Type' => 'text/html' }
    end

  end
end
