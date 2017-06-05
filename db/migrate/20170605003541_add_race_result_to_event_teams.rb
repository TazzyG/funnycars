class AddRaceResultToEventTeams < ActiveRecord::Migration[5.1]
  def change
    add_column :event_teams, :race_result, :integer
  end
end
