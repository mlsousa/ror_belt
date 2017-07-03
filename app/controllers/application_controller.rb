class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :require_login
  helper_method :current_user, :logged_in?
  helper_method :current_song

  def require_login
    redirect_to "/sessions/new" unless session[:user_id]
  end

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end
    def logged_in?
      current_user != nil
    end

  def current_song
    @song ||= Song.find(params[:song][:song_id])
  end

  def user_playlist
    @playlist = current_user.playlist
  end



end
