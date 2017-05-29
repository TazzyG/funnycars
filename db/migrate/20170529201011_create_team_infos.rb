class CreateTeamInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :team_infos do |t|
      t.references :team, foreign_key: true
      t.string :topic, foreign_key: true
      t.text :body
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
