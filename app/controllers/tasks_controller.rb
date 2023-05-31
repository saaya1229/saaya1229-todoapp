class TasksController < ApplicationController
  def show
    @article = Article.find(params[:article_id])
  end

  def new
    @task = Article.find(params[:article_id]).tasks.build
  end
end