require_relative './spec_helper.rb'
require 'rack/test'

describe "Star Sinatra Application" do
  include Rack::Test::Methods

  def app
    StarsController.new
  end

  it "should allow access to root page" do
    get '/'
    expect(last_response.body).to include("Welcome to my star site")
  end
end
