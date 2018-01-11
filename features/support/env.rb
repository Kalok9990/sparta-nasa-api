require 'capybara/cucumber'
require 'rspec'
require 'pry'
require_relative '../lib/constellations'

# The below line of code now means that the chrome driver is registered before every run.
# Any query stated at the top level of the env.rb file will be initiated at every cucumber run

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app,:browser => :chrome)
end

Capybara.configure do |config|
  config.default_max_wait_time= 10 #wait time for asynchronus processes to finsh
  config.match = :prefer_exact #this setting is to ensure Capybara has specific matching rather than fuzzy logic
  config.default_driver = :chrome # ensures chrome is the default driver
  config.app_host = 'localhost:9292' # provides the app host/core url
end

World(Constellations)
