class CreateGenresSongsJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_table :genres_songs, id: false do |t|
      t.integer :genre_id
      t.integer :song_id
    end 

    add_index :genres_songs, :genre_id
    add_index :genres_songs, :song_id 
  end
end
