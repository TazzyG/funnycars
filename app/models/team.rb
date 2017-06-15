class Team < ApplicationRecord
  belongs_to :user
  has_many :team_infos, dependent: :destroy
  has_many :team_pictures, dependent: :destroy
  has_many :race_schedules, through: :event_teams
  has_many :event_teams
  
  mount_uploader :picture, PictureUploader
  
  validates :user_id, presence: true
  validates :team_name, presence: true, length: { maximum: 140 }
  
  validate  :picture_size
  # def self.team_news_feeds 
  #   self.team_news_feeds = NewsFeed.where(team_id == self.id)
  # end
  private

    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 15.megabytes
        errors.add(:picture, "should be less than 15MB")
      end
    end
 
end
