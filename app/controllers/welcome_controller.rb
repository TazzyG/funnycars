class WelcomeController < ApplicationController
  require 'chronic'
  
  def index
    @articles = Article.all.order("created_at DESC")
    @sponsors = Sponsor.all
    @news_feeds = NewsFeed.where(:created_at =>Chronic.parse('June 2 at 1pm').. Time.now).order("created_at DESC ")
  end
  
  

  
end
