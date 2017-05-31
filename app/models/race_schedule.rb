class RaceSchedule < ApplicationRecord
  belongs_to :user
  
  has_many :race_schedules, through: :event_teams
  has_many :event_teams, dependent: :destroy
end
