require "sinatra"
require "sinatra/reloader" if development?
require 'pg'
require_relative './models/star.rb'
require_relative "./controllers/stars_controller.rb"

use Rack::MethodOverride
run StarsController
