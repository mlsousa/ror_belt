class LikesController < ApplicationController

    def new
    end

    def create
      Like.create like_params
      redirect_to "/users/#{current_user.id}"
    end

    def destroy
      @like = Like.find(params[:id])
      @like.destroy if current_user === @like.user
      redirect_to "/bright_ideas"
    end

    private
      def like_params
        params.require(:like).permit(:bright_idea_id).merge(user: current_user)
      end
end
