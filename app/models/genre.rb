class Genre < ActiveRecord::Base
  has_and_belongs_to_many :songs
  has_many :artists, through: :songs

  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods
end