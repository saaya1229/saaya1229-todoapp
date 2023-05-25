class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to article_path(@article), notice: 'Saved!! ;)'
    else
      flash.now[:error] = 'Failed to save :('
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to article_path(@article), notice: 'Updated!! ;)'
    else
      flash.now[:error] = 'Faild to update :('
      render :edit
    end
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy!
    redirect_to root_path, notice: 'Successfully deleted :)'
  end

  private
  def article_params
    params.require(:article).permit(:title, :content)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
