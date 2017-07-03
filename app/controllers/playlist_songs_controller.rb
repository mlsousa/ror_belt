class PlaylistSongsController < ApplicationController
    def index
        @plsongs = PlaylistSong.all
    end

    def new
    end

    def create
        @playlistsongs = PlaylistSong.all
        @playlistsong = PlaylistSong.create(song_id: current_song.id, playlist_id: user_playlist.id, user_id: current_user.id)
        redirect_to "/users/#{current_user.id}"
    end
    
    private
    def playlistsong_params
        params.require(:playlist).permit(:song_id, :playlist_id, :user_id)
    end

end
