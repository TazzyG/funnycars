class Announcement < ApplicationRecord
  belongs_to :user
  mount_uploader :pdf, PdfUploader
  
  validates :title, presence: true, length: { maximum: 60 }
  validates :content, presence: true
  
  belongs_to :race_schedule, optional: true
  
end
