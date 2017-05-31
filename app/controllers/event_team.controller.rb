class EventTeamController < ApplicationContoller 
  before_action :authenticate_user!
  before_action :set_event_team, only: [:edit, :show, :destroy]
  before_action :set_race_schedule, except: [:index]
  
  def index
    @event_teams = EventTeam.all.includes(:team).includes(:race_schedule)
  end
  
  def new
  end
  
  def create
    @event_team = @race_schedule.event_teams.create(event_team_params)
    @event_team.save 
    @race_schedule = @event_team.race_schedule_id
    
    redirect_to race_schedule_path(@race_schedule), notice: "Team successfully Added"
  end
  
  def destroy 
    @event_team.destroy
    redirect_to race_schedule_path(@race_schedule), notice: "Team successfully Added"
  end
  
  private
  
    def set_race_schedule
      @race_schedule = RaceSchedule.find(:race_schedule_id)
    end
    
    def set_event_team
      @event_team = EventTeam.find(params[:id])
    end
    
    def event_team_params
      params.require(:event_team).permit(:race_schedule_id, :team_id)
    end
end