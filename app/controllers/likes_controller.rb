class LikesController < ApplicationController
  def create
    @like = Like.new
    @like.user = User.find params[:user_id]
    @like.idea = Idea.find params[:idea_id]

    @like.save
    redirect_to root_path
  end

  def destroy
    @user = current_user
    @idea = Idea.find params[:idea_id]
    @like = Like.find_by_user_id_and_idea_id(@user, @idea)

    @like.destroy
    redirect_to root_path
  end

end
