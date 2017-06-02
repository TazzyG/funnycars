class ArchivesController < ApplicationController
 
  
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
end
