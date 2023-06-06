class CommentsController < ApplicationController
  def new
    @article = Article.find(params[:article_id])
    @task = @article.tasks.find(params[:task_id])
    @comment = @task.comments.build
    @comment.user_id = current_user.id
  end

  def create
    @article = Article.find(params[:article_id])
    @task = @article.tasks.find(params[:task_id])
    @comment = @task.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to article_task_path(@article, @task), notice: 'Added your comment'
    else
      flash.now[:error] = 'Failed to save your comment'
      render :new
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end