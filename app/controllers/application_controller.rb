class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end
  
  #move to songs
  get '/songs' do
    erb :'/songs/index'
  end
  
  get '/songs/:slug' do
    slug = params[:slug]
    @song = Song.find_by_slug(slug)
    erb :'/songs/show'
  end
  
  #move to artists
  get '/artists' do
    erb :'/artists/index'
  end
  
  get '/artists/:slug' do
    slug = params[:slug]
    @artist = Artist.find_by_slug(slug)
    erb :'/artists/show'
  end
  
  #move to genres
  get '/genres' do
    erb :'/genres/index'
  end
  
  get '/genres/:slug' do
    slug = params[:slug]
    @genre = Genre.find_by_slug(slug)
    erb :'/genres/show'
  end
end