class CreateRaceSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :race_schedules do |t|
      
      t.string :location
      t.string :details
      t.string :race_type
      t.references :user
      t.datetime :race_start_date
      t.datetime :race_end_date
      t.string :color

      t.timestamps
    end
  end
end
