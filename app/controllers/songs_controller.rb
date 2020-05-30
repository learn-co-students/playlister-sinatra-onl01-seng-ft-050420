require 'rack-flash'
class SongsController < ApplicationController
  
  get '/songs' do
    @songs = Song.all
    erb :"/songs/index"
  end

  get '/songs/new' do
    @artists = Artist.all
    @genres = Genre.all
    erb :"/songs/new"
  end 

  post '/songs' do
    song = Song.find_or_create_by(params[:song])
    artist = Artist.find_or_create_by(params[:artist])
    genres = Genre.find(params[:genres])

    song.artist = artist
    song.genres << genres
    song.save

    flash[:message] = "Successfully created song."
    redirect to "/songs/#{song.slug}"
  end 
  
  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :"/songs/show"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])

  end 

end