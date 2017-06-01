class CreateNewsFeeds < ActiveRecord::Migration[5.1]
  def change
    create_table :news_feeds do |t|
      t.integer :race_schedule_id, index: true
      t.references :user, foreign_key: true
      t.integer :team_id, index: true
      t.datetime :date_of_post, index: true
      t.string :picture
      t.string :title
      t.string :content

      t.timestamps
    end
  end
end
