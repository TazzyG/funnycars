class EventTeam < ApplicationRecord
  belongs_to :race_schedule
  belongs_to :team
  
  def team 
    @team = Team.find(team_id)
  end
end
