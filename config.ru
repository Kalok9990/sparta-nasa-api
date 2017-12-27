require "sinatra"
require "sinatra/reloader" if development?
require_relative "./controllers/stars_controller.rb"

run StarsController
