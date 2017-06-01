class NewsFeedsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_news_feed, only: [:show, :edit, :update, :destroy]
  
  def index
    @news_feeds = NewsFeed.all.order("created_at DESC ")
  end
  
  def show
  end

  def new
    @news_feed = current_user.news_feeds.build
  end
  
  def create
    @news_feed = NewsFeed.new(news_feed_params)
    @news_feed.user_id = current_user.id
    if @news_feed.save
      redirect_to @news_feed, notice: 'News_feed was successfully created'
    else
      render action: 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @news_feed.update(news_feed_params)
      redirect_to @news_feed, notice: 'News_feed was updated'
    else
      render action: 'edit'
    end
  end
  
  def destroy
    @news_feed.destroy
    redirect_to news_feeds_url
  end
  
  
  private
  def set_news_feed
   @news_feed = NewsFeed.find(params[:id])   
  end
  def news_feed_params
    params.require(:news_feed).permit(:race_schedule_id, :user_id, :team_id, :date_of_post, :picture, :title, :content)
  end
end


