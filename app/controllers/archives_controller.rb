class ArchivesController < ApplicationController
  
  def photos_2010
    @photos_2010 = NewsFeed.all.order("created_at DESC ")
  end
end
