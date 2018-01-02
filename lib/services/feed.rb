require 'httparty'
require 'json'

class NasaBrowse
  include HTTParty

  base_uri "https://api.nasa.gov/neo/rest/v1"

  def initialize
    @key = "api_key=92KjKXlfAG8eYrh0KhkkRuWKAbIwdEUAsu2wlS5c"
  end

  def get_list
    @browse = JSON.parse(self.class.get("/feed?start_date=#{start_date}&end_date=#{end_date}&#{@key}").body)
  end
end
