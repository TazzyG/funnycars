class AddTopicToTeamInfos < ActiveRecord::Migration[5.1]
  def change
    add_reference :team_infos, :topic, foreign_key: true
  end
end
