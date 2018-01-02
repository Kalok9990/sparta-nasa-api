require 'capybara'
require 'rspec'
require 'rack/test'
require 'sinatra'
require 'sinatra/base'
require_relative '../lib/nasa'
require_relative '../models/star'
require_relative '../controllers/stars_controller'
require_relative '../controllers/api/nasa_api_controller'

def app
  StarsController.new
  NasaApiController.new
end

RSpec.configure do|config|
  config.include Rack::Test::Methods
  config.color = true
  config.formatter = :documentation
end

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app,:browser => :chrome)
end

Capybara.configure do |config|
  config.ignore_hidden_elements = false #to ensure that all hidden elements on a page are recorded/available
  config.default_max_wait_time= 10 #wait time for asynchronus processes to finsh
  config.match = :prefer_exact #this setting is to ensure Capybara has specific matching rather than fuzzy logic
  config.default_driver = :chrome # ensures chrome is the default driver
end
