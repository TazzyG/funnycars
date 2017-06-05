class EventTeamsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_race_schedule, only: [:create]
  before_action :set_event_team, only: [:edit, :update, :destroy]
 
  
  def index
    @event_teams = EventTeam.all
  end
  
  def new
  end
  
  def create
    @event_team = @race_schedule.event_teams.create(event_team_params)
    @event_team.save 
    @team = @event_team.team_id
    @race_schedule = @event_team.race_schedule_id
    
    
    redirect_to race_schedule_path(@event_team), notice: "Team successfully Added"
  end
  
  def edit
  end
  
  def update
    if @event_team.update(event_team_params)
      redirect_to race_schedule_path(@event_team)
    end
  end
  
  def destroy 
    
    @event_team.destroy
    redirect_to race_schedule_path(@race_schedule), notice: "Team successfully Removed"
  end
  
  private
    def set_race_schedule
      @race_schedule = RaceSchedule.find(params:[race_schedule_id])
    end
    
    def set_event_team
      @event_team = EventTeam.find(params[:id])
    end 

    def event_team_params
      params.require(:event_team).permit(:race_schedule_id, :team_id, :race_result)
    end
end
