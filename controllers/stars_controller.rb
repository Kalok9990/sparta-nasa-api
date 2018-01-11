require 'sinatra'

class StarsController < Sinatra::Base

  # sets root as the parent directory of the current file
  set :root, File.join(File.dirname(__FILE__), "..")

  # Sets the view directory correctly
  set :views, Proc.new{File.join(root, "views")}

  # A get request to the / route will respond with our index template with all the stars from the model
  get "/" do
    @title = "Constellations"
    @stars = Star.all
    erb :"stars/index"
  end

  # A post request to / will create a new post with the imformation the user entered which is stored in the params
  post "/" do
    star = Star.new
    star.title = params[:title]
    star.info = params[:info]
    star.image = params[:image]
    star.save
    redirect "/"
  end

  # A get request to /new will respond with a template with our new form that the user can complete to add a new star
  get "/new" do
    @title = "New Star Form"
    @star = Star.new
    erb :"stars/new"
  end

  # goes to the about page
  get "/about" do
    erb :"stars/about"
  end

  # A get request to /:id will respond with a the show template with the requested post
  get "/:id" do
    id = params[:id].to_i
    @star = Star.find(id)
    erb :"stars/show"
  end

  # A request to /:id/edit will respond with a the edit template with the star data of the star we can want to update
  get "/:id/edit" do
    id = params[:id].to_i
    @star = Star.find(id)
    @title = "Edit star"
    erb :"stars/edit"
  end

  # A put request to the /:id will will update an existing star
  put "/:id" do
    id = params[:id]
    star = Star.find(id)
    star.title = params[:title]
    star.info = params[:info]
    star.image = params[:image]
    star.save
    redirect '/'
  end

  # A delete request to /:id will delete the specified post from the db
  delete "/:id" do
    id = params[:id]
    Star.destroy(id)
    redirect '/'
  end
end
