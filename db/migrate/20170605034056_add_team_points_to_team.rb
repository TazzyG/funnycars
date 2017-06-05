class AddTeamPointsToTeam < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :team_points, :integer
  end
end
