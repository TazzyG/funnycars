class RaceSchedulesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_race_schedule, only: [:show, :edit, :update, :destroy]

  def index
    @race_schedules = RaceSchedule.all
    @articles = Article.all
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
  
  private
  
  def set_race_schedule
   @race_schedule = RaceSchedule.find(params[:id])   
  end
  def race_schedule_params
    params.require(:race_schedule).permit(:dates, :location, :details, :race_type, :race_start_date, :race_end_date)
  end
end
