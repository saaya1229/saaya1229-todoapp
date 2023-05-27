class TasksController < ApplicationController
  
  def index
    @articles = Article.all
  end
end