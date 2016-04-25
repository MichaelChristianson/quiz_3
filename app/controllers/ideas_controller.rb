class IdeasController < ApplicationController

  def index
    @ideas = Idea.order(:updated_at, :created_at)
  end

  def show
    @idea = Idea.find params[:id]
  end

  def edit
    @idea = Idea.find params[:id]

    redirect_to root_path unless can? :manage, @idea
  end

  def update
    @idea = Idea.find params[:id]

    redirect_to root_path unless can? :manage, @idea

    if @idea.update idea_params
      redirect_to idea_path @idea
    else
      redirect_to root_path
    end
  end

  def destroy
    @idea = Idea.find params[:id]

    redirect_to root_path unless can? :manage, @idea

    if @idea.destroy
      redirect_to root_path
    else
      render @idea
    end
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new idea_params
    @idea.user_id = current_user.id

    if @idea.save
      redirect_to idea_path @idea
    else
      redirect_to root_path
    end

  end

  private

  def idea_params
    params.require(:idea).permit(:title, :description)
  end

end
