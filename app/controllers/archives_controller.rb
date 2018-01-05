class ArchivesController < ApplicationController

  require 'chronic'
  require 'date'
 
  
  def photos_2010
    @photos_2010 = NewsFeed.all.order("created_at DESC ")
  end
  def photos_2011
    @photos_2011 = NewsFeed.all.order("created_at DESC ")
  end
  def photos_2012
    @photos_2012 = NewsFeed.all.order("created_at DESC ")
  end
  def photos_2013
    @photos_2013 = NewsFeed.all.order("created_at DESC ")
  end
  def photos_2014
    @photos_2014 = NewsFeed.all.order("created_at DESC ")
  end
  def photos_2015
    @photos_2015 = NewsFeed.all.order("created_at DESC ")
  end
  def photos_2016
    @photos_2016 = NewsFeed.all.order("created_at DESC ")
  end
  def photos_2017
    @photos_2017 = NewsFeed.where(created_at: '2017-01-01'.. '2017-12-31').order("created_at DESC ") 
  end
end

