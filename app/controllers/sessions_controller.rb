class SessionsController < ApplicationController

    skip_before_action :require_login


    def new
    end


    def destroy
        session.clear
        redirect_to "/sessions"
    end

end
