require 'spec_helper'

describe "Rack::NoWWW" do

  include Rack::Test::Methods

  def app
    mock_endpoint = lambda { |env| [200, {}, ['Hello, world.']] }
    app = Rack::NoWWW.new(mock_endpoint)
  end



  describe "when receiving a request with a 'www'" do
    context "without the only_hosts parameter" do
      let(:app) { ->(env) { [200, env, "app"] } }
  
      let :middleware do
        Rack::NoWWW.new(app)
      end

      before(:each) do
        request '/', {'HTTP_HOST' => 'www.example.org' }
      end

      it "should issue a 301 redirect" do
        last_response.status.should == 301
      end

      it "should redirect to the URL without the 'www'" do
        last_response.headers['Location'].should == "http://example.org/"
      end

      it "should have a text/html content type" do
        last_response.headers['Content-Type'].should == "text/html"
      end

      it "should have a body of 'Moved Permanently\\n'" do
        last_response.body.should == "Moved Permanently\n"
      end
      
    end

    context "with the only_hosts parameter not matching the domain" do
      let(:app) { ->(env) { [200, env, "app"] } }
  
      let :middleware do
        Rack::NoWWW.new(app, only_hosts: ['www.example.org'])
      end

      before(:each) do
        request '/', {'HTTP_HOST' => 'www.non-redirecting-host.org' }
      end

      it "should not issue a 301 redirect when proper only_hosts param specified" do
        last_response.status.should == 200
      end
    end
  end

  describe "when receiving a request without a 'www'" do
    it "should fall through to the app" do
      get '/'
      last_response.status.should == 200
      last_response.body.should == "Hello, world."
    end
  end

end
