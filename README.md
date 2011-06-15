rack-no-www
===========

This piece of simple middlweware catches requests that begin with "www" 
and redirects them to the equivalent "non-www" address. For example, a 
request to "http://www.example.org" will be redirected to 
"http://example.org".

This kind of redirect adheres to the [no-www philosophy][1], which 
advocates websites having a canonical address without the wasteful "www" 
subdomain. For a site to have a canonical address, it must have a 
single, preferred URL. If a site has multiple URLs that return the same 
content (e.g., a CNAME alias for "http://www.example.org" that points to 
"http://example.org"), search engines might interpret these URLs as 
*different* resources, thus [affecting search rankings and their 
appearance][2]. That's why a site should have a canonical URL. But since 
many users still think "www" is a necessary part of a web address, it's 
important to allow "www" requests and redirect these requests to the 
"non-www" equivalent.

Redirecting to a canonical URL might better be performed at the DNS 
level, or directly by the webserver (e.g., [Apache][3] or [nginx][4]). 
Alas, not all DNS services allow such configuration, and some 
cloud-based hosting solutions, (e.g., [Heroku][5]) don't allow explicit 
server configuration. Hence this piece of middleware.


Installation
------------

    $ gem install rack-no-www


Usage
-----

Simply `require 'rack/no-www'` where appropriate, and then include the 
middleware in the Rack stack. In Rails 3, for example, the 
`config/application.rb` might be adjusted accordingly to place the 
middleware at the top of the Rack stack::

    Module MyApp
      class Application < Rails::Application
        ...
        if Rails.env.production?
          config.middleware.insert_before Rack::Lock, Rack::NoWWW
        end
      end
    end


Credits
-------

This gem is simply a packaged version (with tests) of the idea outlined [here][6] by Trevor Turk.


[1]: http://no-www.org
[2]: http://www.google.com/support/webmasters/bin/answer.py?answer=139066
[3]: http://www.plexusweb.com/staff/travis/blog/post/274/Redirect-www-Subdomain-to-no-www
[4]: http://snippets.aktagon.com/snippets/59-How-to-improve-your-PageRank-with-301-permanent-redirects-when-using-Nginx
[5]: http://heroku.com
[6]: http://trevorturk.com/2009/11/05/no-www-rack-middleware/
