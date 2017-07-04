class UsersController < ApplicationController
    skip_before_action :require_login

    def index
        @users = User.all
        @user = current_user
    end

    def new
    end

    def register
        @user=User.create(name: params[:user][:name], alias: params[:user][:alias], email: params[:user][:email], password: params[:user][:password], password_confirmation: params[:user][:password_confirmation])
        if @user
            session[:user_id] = @user.id
            # @playlist = Playlist.create(user: @user)
            # binding.pry
            # session[:playlist] = @playlist
            # redirect_to "/users/#{@user.id}"
            redirect_to "/users/#{current_user.id}"
        else
            flash[:errors] = ["Your email didn't match any registered ones or your password was incorrect.  Please fill out the registration form completely before proceeding or try logging in again."]
            redirect_to "/"
        end
    end

    def login
        @user = User.find_by_email(params[:user][:email]).try(:authenticate, params[:user][:password])
        if @user
            session[:user_id] = @user.id
            redirect_to "/users/#{current_user.id}"
        else
            flash[:errors] = ["Your email didn't match any registered ones or your password was incorrect.  Please fill out the registration form completely before proceeding or try logging in again."]
            redirect_to "/"
        end
    end

    def show
        @user=User.find(params[:id])
        @users=User.all
    end

    def edit
        @user = User.find(session[:user_id])
    end

    private
        def require_correct_user
            if current_user!=User.find(params[:id])
                redirect_to "/users/#{session[:user_id]}"
            else
                flash[:errors] = "You can't do that"
            end
        end

        def user_params
            params.require(:user).permit(:id, :name, :alias, :email, :password, :password_confirmation)
        end
end
