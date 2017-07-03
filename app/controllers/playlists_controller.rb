class PlaylistsController < ApplicationController

    skip_before_action :require_login

    def create
        @playlist = Playlist.create(user: current_user)
        session[:playlist] = @playlist
        redirect_to "/users/#{current_user.id}"
    end

    def update
        @songs=Song.all
        @song=Song.find(params[:song][:song_id])
        @users=User.all
        playlist = current_user.playlist
        # if @playlist === nil
        #     redirect_to "/playlists"
        # else
        playlist.update playlist_params
        redirect_to "/songs/#{@song.id}"
        # end
    end

    def show
        @playlists = Playlist.all
    end

    private
        def playlist_params
            params.require(:song).permit(:id, :title, :author).merge(user: current_user)
        end

end
