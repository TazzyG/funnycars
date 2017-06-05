class StandingsController < ApplicationController
  def index
    @event_teams = EventTeam.all.order("race_result DESC").includes(:team)
    @teams = Team.all
  end
end
