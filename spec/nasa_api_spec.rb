require_relative 'spec_helper'

describe NasaApiController do

  def app
    NasaApiController.new
  end

  it "loads browse page" do
    get "/api/browse"
    expect(last_response).to be_ok
    expect(last_response.body).to include("neo reference id")
  end

  it "loads the lookup page" do
    get "/api/lookup"
    expect(last_response).to be_ok
    expect(last_response.body).to include("Look up an asteroid")
  end

  it "loads the feed page" do
    get "/api/feed"
    expect(last_response).to be_ok
    expect(last_response.body).to include("Asteroid between dates")
  end
end
