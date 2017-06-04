class Announcement < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true, length: { maximum: 60 }
  validates :content, presence: true
  
end
