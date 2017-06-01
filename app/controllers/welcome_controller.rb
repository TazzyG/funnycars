class WelcomeController < ApplicationController
  
  def index
    @articles = Article.all
    @sponsors = Sponsor.all
    @news_feeds = NewsFeed.all.order("created_at DESC ")
  end
end
