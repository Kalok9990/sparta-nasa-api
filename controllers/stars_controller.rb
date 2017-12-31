class StarsController < Sinatra::Base

  # sets root as the parent directory of the current file
  set :root, File.join(File.dirname(__FILE__), "..")
  set :views, Proc.new{File.join(root, "views")}

  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    @title = "Stars"
    @stars = Star.all
    erb :"stars/index"
  end

  post "/" do
    star = Star.new
    star.title = params[:title]
    star.info = params[:info]
    star.image = params[:image]
    star.save
    redirect "/"
  end

  get "/new" do
    @title = "New Star Form"
    @star = Star.new
    erb :"stars/new"
  end

  get "/:id" do
    id = params[:id].to_i
    @star = Star.find(id)
    erb :"stars/show"
  end

  get "/:id/edit" do
    id = params[:id].to_i
    @star = Star.find(id)
    @title = "Edit star"
    erb :"stars/edit"
  end

  put "/:id" do
    id = params[:id]
    star = Star.find(id)
    star.title = params[:title]
    star.info = params[:info]
    star.image = params[:image]
    star.save
    redirect '/'
  end

  delete "/:id" do
    id = params[:id]
    Star.destroy(id)
    redirect '/'
  end
end
