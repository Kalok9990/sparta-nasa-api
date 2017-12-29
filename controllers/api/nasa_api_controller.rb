require 'neows'

class NasaApiController < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), "../..")
  set :views, Proc.new{File.join(root, "views")}
  client = Neows::REST::Client.new

  configure :development do
    register Sinatra::Reloader
  end

  get '/api/browse' do
    api_result = client.browse
    output = ''

    api_result['near_earth_objects'].each do |w|
      neo_ref_id = w['neo_reference_id']
      name = w['name']
      output << "<tr><td><a href=''>#{neo_ref_id}</td></a><td>#{name}</td></tr>"
    end

    erb :'nasa/browse', :locals => {results: output}
  end
end
