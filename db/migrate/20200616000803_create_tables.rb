  
class CreateTables < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :name
      t.integer :artist_id
    end

    create_table :genres_songs, id: false do |t|
      t.integer :genre_id
      t.integer :song_id
    end

    add_index :genres_songs, :genre_id
    add_index :genres_songs, :song_id

    create_table :artists do |t|
      t.string :name
    end

    create_table :genres do |t|
      t.string :name
    end
  end
end