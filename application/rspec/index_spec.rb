require File.dirname(__FILE__) + '/spec_helper'
set :environment, :test

describe "Application Test" do
  include Rack::Test::Methods

  def app
    @app ||= Sinatra::Application
  end

  it "should respond to /" do
    get '/'
    last_response.should be_ok
    last_response.body.should match(/Buildings Rule!/)
  end

  it "should list the buildings" do
    get '/'
    last_response.body.should match(/Freedom Tower/)
    last_response.body.should match(/Burj Khalifa/)
  end
end
