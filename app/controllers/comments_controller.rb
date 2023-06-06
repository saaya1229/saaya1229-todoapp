class CommentsController < ApplicationController
  def new
    @article = Article.find(params[:article_id])
    @task = @article.tasks.find(params[:task_id])
    @comment = @task.comments.build
  end
end