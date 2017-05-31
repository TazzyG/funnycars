class EventTeamsController < ApplicationController
  before_action :authenticate_user!
 
  
  def index
    @event_teams = EventTeam.all
  end
  
  def new
  end
  
  def create
    @race_schedule = RaceSchedule.find(params[:race_schedule_id])
    @event_team = @race_schedule.event_teams.create(event_team_params)
    @event_team.save 
    @team = @event_team.team_id
    @race_schedule = @event_team.race_schedule_id
    
    
    redirect_to race_schedule_path(@race_schedule), notice: "Team successfully Added"
  end
  
  def destroy 
    @race_schedule = RaceSchedule.find(params[:race_schedule_id])
    @event_team = @race_schedule.event_teams.find(params[:id])
    @event_team.destroy
    redirect_to race_schedule_path(@race_schedule), notice: "Team successfully Removed"
  end
  
  private
  

    def event_team_params
      params.require(:event_team).permit(:race_schedule_id, :team_id)
    end
end
