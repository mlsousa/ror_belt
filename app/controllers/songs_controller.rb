class SongsController < ApplicationController

    skip_before_action :require_login

    def index
        @songs = Song.all
    end

    def new
    end

    def show
        @playlistsongs = PlaylistSong.all
        @songs = Song.all
        @song = Song.find(params[:id])
        @playlists = Playlist.all
        @users = User.all
    end

    def create
        @songs = Song.all
        @song = Song.create song_params
        if @song
          redirect_to "/songs/index"
        else
          flash[:errors] = @song.errors.full_messages
          redirect_to "/users/#{current_user.id}"
        end

    end

    # def update
    #     current_user.playlist.update(song_id: current_song.id)
    #     redirect_to "/songs/#{current_song.id}"
    #
    # end


    private
    def song_params
        params.require(:song).permit(:artist, :title)
    end


end
