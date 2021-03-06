class RaceSchedulesController < ApplicationController

  require 'date'
  require 'chronic'
  
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_race_schedule, only: [:show, :edit, :update, :destroy]
  
  def index
    @current_race_schedules = RaceSchedule.where(:created_at =>Chronic.parse('Jan 1 2018 at 1am').. Time.now).order("created_at DESC ") 
    @last_year_race_schedules = RaceSchedule.where(created_at: '2017-06-06'.. '2017-12-31').order("created_at DESC ") 
    @race_schedules = RaceSchedule.all.order("race_start_date ASC")
    @articles = Article.all.order("created_at DESC")
  end
  
  def show
    
  end
  
  def new
    @race_schedule = current_user.race_schedules.build
  end
  
  def create
    @race_schedule = RaceSchedule.new(race_schedule_params)
    @race_schedule.user_id = current_user.id
    if @race_schedule.save
      redirect_to @race_schedule, notice: 'Race_schedule was successfully created'
    else
      render action: 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @race_schedule.update(race_schedule_params)
      redirect_to @race_schedule, notice: 'Race_schedule was updated'
    else
      render action: 'edit'
    end
  end
  
  
  
  def destroy
    @race_schedule.destroy
    redirect_to race_schedules_url
  end
  
  def set_color
    if @race_schedule.race_start_date < Date.today
      @race_schedule.color = "text-muted"
    else
      @race_schedule.color = "text-info"
    end
    
  end
  
  private
  
  
  def set_race_schedule
   @race_schedule = RaceSchedule.find(params[:id])  
  end
  
  
  def race_schedule_params
    params.require(:race_schedule).permit(:dates, :location, :details, :race_type, :race_start_date, :race_end_date, :color)
  end
end
