class IdeasController < ApplicationController
  before_action :set_idea, only: %i[show edit update destroy]

  def index
    @search = current_user.ideas.ransack(params[:q])
    @ideas = @search.result.page(params[:page]).includes(:user).recent
  end

  def show
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = current_user.ideas.build(idea_params)
    if @idea.save
      redirect_to ideas_path, success: t('ideas.flash.create.success')
    else
      flash.now[:danger] = t 'ideas.flash.create.danger'
      render :new
    end
  end

  def edit; end

  def update
    if @idea.update(idea_params)
      redirect_to idea_path, success: t('ideas.flash.edit.success')
    else
      flash.now[:danger] = t 'ideas.flash.edit.danger'
      render :edit
    end
  end

  def destroy
    @idea.destroy!
    redirect_to ideas_path, success: t('ideas.flash.destroy.success')
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :body, :category)
  end

  def set_idea
    @idea = current_user.ideas.find(params[:id])
  end
end
