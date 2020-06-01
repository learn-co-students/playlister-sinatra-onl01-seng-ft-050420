class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, :through => :songs
  
  def slug
    return self.name.gsub(" ", "-").downcase
  end
end