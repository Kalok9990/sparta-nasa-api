require_relative 'spec_helper'

describe NasaApiController do

  it "loads browse page" do
    get "/api/browse"
    expect(last_response).to be_ok
  end

  it "loads the lookup page" do
    get "/api/lookup"
    expect(last_response).to be_ok
  end

  it "loads the feed page" do
    get "/api/feed"
    expect(last_response).to be_ok
  end
end
