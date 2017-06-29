class RaceSchedule < ApplicationRecord
  belongs_to :user
  has_many :teams, through: :event_teams
  has_many :event_teams, dependent: :destroy
  has_many :announcements
  has_many :news_feeds
  
end
