class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :team_name, index:true
      t.string :driver
      t.string :home_town
      t.string :crew_chief
      t.string :crew
      t.string :car_name
      t.string :car
      t.string :engine
      t.string :chassis
      t.string :picture
      t.string :facebook
      t.string :youtube
      t.string :instagram
      t.integer :user_id, index: true

      t.timestamps
    end
  end
end
