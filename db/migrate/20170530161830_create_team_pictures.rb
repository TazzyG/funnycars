class CreateTeamPictures < ActiveRecord::Migration[5.1]
  def change
    create_table :team_pictures do |t|
      t.string :picture
      t.references :user, foreign_key: true
      t.references :team, foreign_key: true
      t.integer :event_id, index: true
      t.string :title

      t.timestamps
    end
  end
end
