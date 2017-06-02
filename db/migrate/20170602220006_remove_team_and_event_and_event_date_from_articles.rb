class RemoveTeamAndEventAndEventDateFromArticles < ActiveRecord::Migration[5.1]
  def change
    remove_index :articles, :event_date
    remove_index :articles, :event_id
    remove_index :articles, :team_id
    remove_column :articles, :archive
    remove_column :articles, :event_id
    remove_column :articles, :event_date
    remove_column :articles, :team_id
    remove_column :articles, :feature
  end
end
