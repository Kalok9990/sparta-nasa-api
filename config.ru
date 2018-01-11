require "sinatra"
require 'pg'
require 'httparty'
require 'json'
require_relative './models/star.rb'
require_relative './controllers/stars_controller.rb'
require_relative './controllers/api/nasa_api_controller.rb'

use Rack::MethodOverride
run Rack::Cascade.new([
  StarsController,
  NasaApiController
])
