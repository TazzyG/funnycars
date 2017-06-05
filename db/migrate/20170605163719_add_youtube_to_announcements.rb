class AddYoutubeToAnnouncements < ActiveRecord::Migration[5.1]
  def change
    add_column :announcements, :youtube, :string
  end
end
