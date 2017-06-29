class WelcomeController < ApplicationController
  require 'chronic'
  
  def index
    @articles = Article.all.order("created_at DESC")
    @sponsors = Sponsor.all
    @news_feeds = NewsFeed.where(:created_at =>Chronic.parse('June 2 at 1pm').. Time.now).order("created_at DESC ") 
    @announcements = Announcement.all.order("created_at DESC")
    @main_news_feeds = @news_feeds.where(:race_schedule_id == nil).paginate(:page => params[:page], :per_page =>10)
  end
  
  def nl2br(s)
    @s.gsub(/\n/, '<br>')
  end
  
end
