class EventTeam < ApplicationRecord
  belongs_to :race_schedule
  belongs_to :team
  
  validates :team_id, presence: true, uniqueness: {scope: "race_schedule"}
  validates :race_schedule_id, presence: true
  validates :race_result, presence: true
  
  # def team 
  #   @team = Team.find(team_id)
  # end
  # def race_schedule
  #   @race_schedule = RaceSchedule.find(race_schedule_id)
  # end

end
