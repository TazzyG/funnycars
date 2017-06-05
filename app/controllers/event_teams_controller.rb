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
    add_team_points(@event_team.team_id)
    redirect_to race_schedule_path(@race_schedule), notice: "Result successfully Added"
  end
  
  def add_team_points(team)
    @team = Team.find(team)
    @team.team_points += @event_team.race_result
    @team.save
  end
  
  def remove_team_points(team)
    @team = Team.find(team)
    @team.team_points -= @event_team.race_result
    @team.save
  end
  
  
  def destroy 
    
    @event_team.destroy
    remove_team_points(@event_team.team_id)
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
      params.require(:event_team).permit(:race_schedule_id, :team_id, :race_result, :team)
    end
end
