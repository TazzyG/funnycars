class AddPdfToAnnouncements < ActiveRecord::Migration[5.1]
  def change
    add_column :announcements, :pdf, :string
    add_column :announcements, :race_schedule_id, :integer, index: true
  end
end
