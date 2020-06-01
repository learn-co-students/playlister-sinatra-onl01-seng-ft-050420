class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  
  def slug
    return self.name.gsub(" ", "-").downcase
  end
end