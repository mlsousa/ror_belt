class SessionsController < ApplicationController

    skip_before_action :require_login


    def new
    end

    def login
        @user = User.find_by_email(params[:user][:email]).try(:authenticate, params[:user][:password])
        if @user
            session[:user_id] = @user.id
            redirect_to "/users/#{@user.id}"
        else
            flash[:errors] = ["Your email didn't match any registered ones or your password was incorrect.  Please fill out the registration form completely before proceeding or try logging in again."]
            redirect_to "/"
        end
    end


    def destroy
        session.clear
        redirect_to "/sessions"
    end

end
