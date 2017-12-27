class StarsController < Sinatra::Base

  # sets root as the parent directory of the current file
  set :root, File.join(File.dirname(__FILE__), "..")
  set :views, Proc.new{File.join(root, "views")}

  configure :development do
    register Sinatra::Reloader
  end

  $stars = [{
  	id: 0,
  	title: "Star 1",
  	body: "This is the first star",
    source: "https://i.pinimg.com/736x/da/8e/fc/da8efc68a9eb13b228eee3609962a1a5--cute-dog-costumes-puppy-costume.jpg"
  },
  {
    id: 1,
    title: "Star 2",
    body: "This is the second star",
    source: "https://i.pinimg.com/736x/be/82/15/be821544fc5f328567cb538f96edb49a--snowball-too-cute.jpg"
  },
  {
    id: 2,
    title: "Star 3",
    body: "This is the third star",
    source: "http://vignette4.wikia.nocookie.net/lotrminecraftmod/images/3/32/Cute-Dog-dogs-13286656-1024-768.jpg/revision/latest?cb=20150222011858"
  }];

  get "/" do
    @title = "Star Homepage"
    erb :"stars/home"
  end

  get "/stars" do
    @title = "Stars"
    @stars = $stars
    erb :"stars/index"
  end

  post "/stars" do
    "Creates new stars"
  end

  get "/stars/new" do
    @title = "New Star Form"
    erb :"stars/newstar"
  end

  get "/stars/:id" do
    id = params[:id].to_i
    @star = $stars[id]
    erb :"stars/show"
  end

  get "/stars/:id/edit" do
    id = params[:id].to_i
    @star = $stars[id]
    @title = "Edit star"
    erb :"stars/edit"
  end

  put "/stars/:id" do
    id = params[:id]
    "Updates star #{id}"
  end

  delete "/stars/:id" do
    id = params[:id]
    "Deletes star #{id}"
  end
end
