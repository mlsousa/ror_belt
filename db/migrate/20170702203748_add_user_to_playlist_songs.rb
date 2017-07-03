class AddUserToPlaylistSongs < ActiveRecord::Migration[5.0]
  def change
    add_reference :playlist_songs, :user, foreign_key: true
  end
end
