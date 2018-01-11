require 'rspec'
require 'rack/test'
require 'pg'
require_relative '../lib/nasa'
require_relative '../models/star'
require_relative '../controllers/stars_controller'
require_relative '../controllers/api/nasa_api_controller'

RSpec.configure do|config|
  config.include Rack::Test::Methods
  config.color = true
  config.formatter = :documentation
end
