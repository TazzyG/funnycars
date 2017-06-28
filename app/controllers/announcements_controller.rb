class AnnouncementsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_announcement, only: [:show, :edit, :update, :destroy]
  
  def index
    @announcements = Announcement.all.order("created_at DESC")
  end
  
  def show
  end

  def new
    @announcement = current_user.announcements.build
  end
  
  def create
    @announcement = Announcement.new(announcement_params)
    @announcement.user_id = current_user.id
    if @announcement.save
      redirect_to @announcement, notice: 'Announcement was successfully created'
    else
      render action: 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @announcement.update(announcement_params)
      redirect_to @announcement, notice: 'Announcement was updated'
    else
      render action: 'edit'
    end
  end
  
  def destroy
    @announcement.destroy
    redirect_to root_path
  end
  
  def nl2br(s)
    @s.gsub(/\n/, '<br>')
  end
  
  
  private
  def set_announcement
   @announcement = Announcement.find(params[:id])   
  end
  def announcement_params
    params.require(:announcement).permit(:title, :sub_title, :content, :sticky, :youtube, :user_id, :pdf, :pdf_cache, :race_schedule_id)
  end
end
