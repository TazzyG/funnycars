class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  
  def index
    @articles = Article.all.order("created_at DESC")
  end
  
  def show
  end

  def new
    @article = current_user.articles.build
  end
  
  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      redirect_to @article, notice: 'Article was successfully created'
    else
      render action: 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @article.update(article_params)
      redirect_to @article, notice: 'Article was updated'
    else
      render action: 'edit'
    end
  end
  
  def destroy
    @article.destroy
    redirect_to articles_url
  end
  
  
  private
  def set_article
   @article = Article.find(params[:id])   
  end
  def article_params
    params.require(:article).permit(:title, :content, :picture, :picture_cache, :event_id, :event_date, :user_id, :feature, :archive)
  end
end
