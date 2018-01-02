require_relative 'spec_helper'

describe StarsController do

  context ""

  it "loads homepage" do
    get "/"

    expect(last_response).to be_truthy
  end
end
