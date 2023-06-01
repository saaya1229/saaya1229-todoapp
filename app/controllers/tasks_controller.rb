class TasksController < ApplicationController
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
      flash.now[:error] = 'Faild to Saved your task:('
      render :new
    end
  end

  private
  def task_params
    params.require(:task).permit(:title, :content, :start_date, :end_date)
  end
end