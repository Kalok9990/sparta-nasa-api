require 'spec_helper'

ENV['RACK_ENV'] = 'test'

describe 'StarsController' do

  include Rack::Test::Methods

  def app
    StarsController.new
  end

  context "should go to homepage" do
    it "loads homepage" do
      get "/"
      expect(last_response.status).to eq 200
    end

    it "includes 'Welcome to my star site' on the page" do
      get "/"
      expect(last_response.body).to include("Welcome to a starry night")
    end
  end

  context "should go to a new form page" do
    it "loads the new form page" do
      get "/new"
      expect(last_response.status).to eq 200
    end

    it "should include 'Title', 'Info' and 'Image'" do
      get "/new"
      expect(last_response.body).to include("Title", "Info", "Image")
    end
  end

  context "should load the show page with relevant information on the relevant star" do
    it "loads the show page" do
      get "/2"
      expect(last_response.status).to eq 200
    end

    it "includes 'Taurus'" do
      get "/2"
      expect(last_response.body).to include("Taurus")
    end
  end

  context "should load the form with relevant information of the star already in the input boxes" do
    it "loads the edit page" do
      get "/27/edit"
      expect(last_response.status).to eq 200
    end

    it "should include Libra" do
      get "/27/edit"
      expect(last_response.body).to include("Cancer")
    end
  end

  context "should create a new star" do
    it "save the star" do
      post "/", params = {
        'title' => 'Scorpio',
        'info' => 'It is a constellation that represents a scorpion',
        'image' => 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8a/CancerCC_cropped.jpg/256px-CancerCC_cropped.jpg'
      }
      follow_redirect!
      expect(last_response.body).to include("Scorpio")
    end

    it "redirects to '/'" do
      post "/"
      follow_redirect!
      expect(last_request.path).to eq('/')
    end
  end
end
