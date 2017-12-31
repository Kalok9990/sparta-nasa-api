require 'neows'

class NasaApiController < Sinatra::Base

  # Sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), "../..")

  # Sets the view directory correctly
  set :views, Proc.new{File.join(root, "views")}

  # Sets a new client for the gem neows
  client = Neows::REST::Client.new

  # Enables the reloader so we dont need to keep restarting the server
  configure :development do
    register Sinatra::Reloader
  end

  # A get request to the api browse service which will respond with the data that is fetched
  get '/api/browse' do

    # A gem method that uses the browse service
    api_result = client.browse
    output = ''

    # Loops through the hash and fetches the relevant information and adds a column to output
    api_result['near_earth_objects'].each do |w|
      neo_ref_id = w['neo_reference_id']
      name = w['name']
      output << "<tr>
                <td>
                <a href='/api/#{neo_ref_id}'>#{neo_ref_id}</a>
                </td>
                <td>#{name}</td>
                </tr>"
    end

    # renders on browse page
    erb :'nasa/browse', :locals => {results: output}
  end

  # renders a lookup page
  get '/api/lookup' do
    erb :'nasa/lookup'
  end

  # A post request that receives a user input and fetches information accordingly
  post '/api/' do
    id = params[:id]
    id_url = "https://api.nasa.gov/neo/rest/v1/neo/#{id}?api_key=92KjKXlfAG8eYrh0KhkkRuWKAbIwdEUAsu2wlS5c"
    response = HTTParty.get(id_url)
    @feed = response.parsed_response
    @neo_id = @feed['neo_reference_id']
    @name = @feed['name']
    @km_max = @feed['estimated_diameter']['kilometers']['estimated_diameter_max']
    @km_min = @feed['estimated_diameter']['kilometers']['estimated_diameter_min']
    @m_max = @feed['estimated_diameter']['meters']['estimated_diameter_max']
    @m_min = @feed['estimated_diameter']['meters']['estimated_diameter_min']
    @miles_max = @feed['estimated_diameter']['miles']['estimated_diameter_max']
    @miles_min = @feed['estimated_diameter']['miles']['estimated_diameter_min']
    @feet_max = @feed['estimated_diameter']['feet']['estimated_diameter_max']
    @feet_min = @feed['estimated_diameter']['feet']['estimated_diameter_min']
    @hazardous = @feed['is_potentially_hazardous_asteroid']
    @link = @feed['links']['self']

    # renders on show page
    erb :'nasa/show'
  end

  # renders a feed page
  get '/api/feed' do
    erb :'nasa/feed'
  end

  # A post request that receives a user input and fetches information accordingly
  post '/api/dates/' do
    @startdate = params[:start_date]
    @enddate = params[:end_date]
    if @startdate == "" && @enddate == ""
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

    # renders on dates page
    erb :'nasa/dates'
  end

  # A get request to the api browse service which will respond with the data that is fetched
  get '/api/:id' do
    id = params[:id]
    id_url = "https://api.nasa.gov/neo/rest/v1/neo/#{id}?api_key=92KjKXlfAG8eYrh0KhkkRuWKAbIwdEUAsu2wlS5c"
    response = HTTParty.get(id_url)
    @feed = response.parsed_response
    @neo_id = @feed['neo_reference_id']
    @name = @feed['name']
    @km_max = @feed['estimated_diameter']['kilometers']['estimated_diameter_max']
    @km_min = @feed['estimated_diameter']['kilometers']['estimated_diameter_min']
    @m_max = @feed['estimated_diameter']['meters']['estimated_diameter_max']
    @m_min = @feed['estimated_diameter']['meters']['estimated_diameter_min']
    @miles_max = @feed['estimated_diameter']['miles']['estimated_diameter_max']
    @miles_min = @feed['estimated_diameter']['miles']['estimated_diameter_min']
    @feet_max = @feed['estimated_diameter']['feet']['estimated_diameter_max']
    @feet_min = @feed['estimated_diameter']['feet']['estimated_diameter_min']
    @hazardous = @feed['is_potentially_hazardous_asteroid']
    @link = @feed['links']['self']

    # renders on show page
    erb :'nasa/show'
  end
end
