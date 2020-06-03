require 'rack-flash'

class ApplicationController < Sinatra::Base
  use Rack::Flash
   
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

  post '/songs' do
    @song = Song.create(params[:song])
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song.genre_ids = params[:genres]
    @song.save

    redirect("/songs/#{@song.slug}")
  end
  
  get '/songs/new' do
    erb :'songs/new'
  end
  
  post '/songs' do
    name = params[:song]
    artist = params[:artist][:name]
    genres = params[:genres]
    
    @song = Song.create(name)
    @song.artist = Artist.find_or_create_by(name: artist)
    @song.genre_ids = genres
    @song.save
  end
  
  get '/songs/:slug' do
    slug = params[:slug]
    @song = Song.find_by_slug(slug)
    erb :'/songs/show'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song.genre_ids = params[:genres]
    @song.save

    redirect("/songs/#{@song.slug}")
  end
  
  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
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