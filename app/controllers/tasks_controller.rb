class TasksController < ApplicationController
  before_action :authenticate_user!

  def show
    @article = Article.find(params[:article_id])
    @task = @article.tasks.find(params[:id])

    @comments = @task.comments
  end

  def new
    article = Article.find(params[:article_id])
    @task = article.tasks.build
    @task.user_id = current_user.id
  end

  def create
    article = Article.find(params[:article_id])
    @task = article.tasks.build(task_params)
    @task.user_id = current_user.id
    if @task.save
      redirect_to article_path(article), notice: 'Your task is saved!! ;)'
    else
      flash.now[:error] = 'Faild to save your task:('
      render :new
    end
  end

  def edit
    @article = Article.find(params[:article_id])
    @task = @article.tasks.find(params[:id])
  end

  def update
    @article = Article.find(params[:article_id])
    @task = current_user.tasks.find(params[:id])
    if @task.update(task_params)
      redirect_to article_path(@article), notice: 'Your task is updated!!'
    else
      flash.now[:error] = 'Faild to update your task:('
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @task = current_user.tasks.find(params[:id])
    if @task.destroy!
      redirect_to article_path(@article), notice: 'Success to delete your task'
    else
      flash.now[:error] = 'Faild to delete your task'
      render :show
    end
  end

  private
  def task_params
    params.require(:task).permit(:title, :content, :start_date, :end_date, :eyecatch)
  end
end