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
    @genres = Genre.all
    erb :"/songs/edit"
  end 

  patch '/songs/:slug' do 
    song = Song.find_by_slug(params[:slug])
    song.update(params[:song])
    song.genres = Genre.find(params[:genres])

    unless params[:song][:name].empty?
      song.artist = Artist.find_or_create_by(params[:artist])
      song.save
    end 

    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{song.slug}"
  end 

end