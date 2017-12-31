require 'neows'

class NasaApiController < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), "../..")
  set :views, Proc.new{File.join(root, "views")}
  client = Neows::REST::Client.new
  @key = "api_key=92KjKXlfAG8eYrh0KhkkRuWKAbIwdEUAsu2wlS5c"
  configure :development do
    register Sinatra::Reloader
  end

  get '/api/browse' do

    api_result = client.browse
    output = ''

    api_result['near_earth_objects'].each do |w|
      neo_ref_id = w['neo_reference_id']
      name = w['name']
      output << "<tr><td><a href='/api/<%= @neo_ref_id %><%= #{neo_ref_id} %>'>#{neo_ref_id}</td></a><td>#{name}</td></tr>"
    end

    erb :'nasa/browse', :locals => {results: output}
  end

  get '/api/lookup' do
    erb :'nasa/lookup'
  end

  post '/api/' do
    id = params[:id]
    id_url = "https://api.nasa.gov/neo/rest/v1/neo/#{id}?api_key=92KjKXlfAG8eYrh0KhkkRuWKAbIwdEUAsu2wlS5c"
    response = HTTParty.get(id_url)
    @feed = response.parsed_response
    erb :'nasa/show'
  end

  get '/api/feed' do
    erb :'nasa/feed'
  end

  post '/api/dates/' do
    startdate = params[:start_date]
    enddate = params[:end_date]
    if startdate == "" && enddate == ""
      id_url = "https://api.nasa.gov/neo/rest/v1/feed/today?detailed=true&api_key=92KjKXlfAG8eYrh0KhkkRuWKAbIwdEUAsu2wlS5c"
    else
      id_url = "https://api.nasa.gov/neo/rest/v1/feed?start_date=#{startdate}&end_date=#{enddate}&api_key=92KjKXlfAG8eYrh0KhkkRuWKAbIwdEUAsu2wlS5c"
    end
    response = HTTParty.get(id_url)
    @feed = response.parsed_response
    @element_count = @feed['element_count']
    @next = @feed['links']['next']
    @prev = @feed['links']['prev']
    @neow = @feed['near_earth_objects']
    @date = @feed['near_earth_objects'].keys

    erb :'nasa/dates'
  end
end
