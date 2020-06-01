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
  
  #move to artists
  get '/artists' do
    erb :'/artists/index'
  end
  
  #move to genres
  get '/genres' do
    erb :'/genres/index'
  end
end