class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :picture
      t.references :user, foreign_key: true
      t.integer :event_id, index: true
      t.datetime :event_date, index: true
      t.string :title
      t.text :content
      t.boolean :feature
      t.boolean :archive

      t.timestamps
    end
  end
end
