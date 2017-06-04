class CreateAnnouncements < ActiveRecord::Migration[5.1]
  def change
    create_table :announcements do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.string :sub_title
      t.text :content
      t.boolean :sticky

      t.timestamps
    end
  end
end
