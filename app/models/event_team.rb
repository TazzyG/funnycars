class EventTeam < ApplicationRecord
  belongs_to :race_schedule
  belongs_to :team
end
