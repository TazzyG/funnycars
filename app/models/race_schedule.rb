class RaceSchedule < ApplicationRecord
  belongs_to :user
  has_many :teams, through: :event_teams
  has_many :event_teams
  
end
