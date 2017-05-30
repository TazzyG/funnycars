class AddTeamToArticles < ActiveRecord::Migration[5.1]
  def change
    add_reference :articles, :team, foreign_key: true
  end
end
