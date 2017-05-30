class AddTopicToTeamInfos < ActiveRecord::Migration[5.1]
  def change
    remove_column :team_infos, :topic, :string
    
  end
end
