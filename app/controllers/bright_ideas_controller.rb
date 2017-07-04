class BrightIdeasController < ApplicationController

    def index
        @bright_ideas = BrightIdea.all
    end

    def new
    end

    def create
      @bright_ideas = BrightIdea.all
      @bright_idea = BrightIdea.create bright_idea_params
      if @bright_idea
        redirect_to "/bright_ideas"
      else
        flash[:errors] = @bright_idea.errors.full_messages
        redirect_to "/users/#{current_user.id}"
      end
    end
    def show
        @bright_ideas = BrightIdea.all
        binding.pry
    end

    def update
      @bright_idea = BrightIdea.find(params[:id])
      @bright_idea.destroy if @bright_idea.user === current_user
      redirect_to "/users/#{current_user.id}"
    end
    def destroy
      @bright_idea = BrightIdea.find(params[:id])
      @bright_idea.destroy if @bright_idea.user === current_user
      redirect_to "/users/#{current_user.id}"
    end

    private
      def bright_idea_params
          params.require(:bright_idea).permit(:idea).merge(user: current_user)
      end
end
