class WelcomeController < ApplicationController
  require 'chronic'
  
  def index
    @articles = Article.all.order("created_at DESC")
    @sponsors = Sponsor.all
    @news_feeds = NewsFeed.where(:created_at =>Chronic.parse('Jan 1 2018 at 1am').. Time.now).order("created_at DESC ") 
    @announcements = Announcement.where(:created_at =>Chronic.parse('Jan 1 2018 at 1am').. Time.now).order("created_at DESC ")
    @main_news_feeds = @news_feeds.where(:race_schedule_id => nil)
  end
  
  def nl2br(s)
    @s.gsub(/\n/, '<br>')
  end
  
end
