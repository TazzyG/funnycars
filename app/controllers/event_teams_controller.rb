class EventTeamsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event_team, only: [:edit, :update, :destroy]
  before_action :set_race_schedule
  
 
  
  def index
    @event_teams = EventTeam.all
  end
  
  def new
  end
  
  def create
    
    @event_team = @race_schedule.event_teams.create(event_team_params)
    @event_team.save 
    # @team = @event_team.team_id
    # @race_schedule = @event_team.race_schedule_id
    @event_team.team.team_points += @event_team.race_result
    @event_team.team.save 
    
    
    redirect_to race_schedule_path(@race_schedule), notice: "Result successfully Added"
  end
  
  
  def destroy 
    
    @event_team.destroy
    @event_team.team.team_points -= @event_team.race_result
    redirect_to race_schedule_path(@race_schedule), notice: "Team successfully Removed"
  end
  
  private
    
    def set_event_team
      @event_team = EventTeam.find(params[:id])
    end 
    
    def set_race_schedule
      @race_schedule = RaceSchedule.find(params[:race_schedule_id])
    end
    
    def event_team_params
      params.require(:event_team).permit(:race_schedule_id, :team_id, :race_result)
    end
end
