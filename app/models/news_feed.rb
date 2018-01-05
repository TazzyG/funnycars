class NewsFeed < ApplicationRecord
  
  belongs_to :user
  belongs_to :race_schedule, optional: true
  
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 60 }
  validates :picture, presence: true
  validates :content, length: { maximum: 4500 }
  
  def team 
    @team = Team.find(team_id)
  end
  
  def race_schedule
    RaceSchedule.find(self.race_schedule_id) 
  end
  
  validate  :picture_size
  private

    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 15.megabytes
        errors.add(:picture, "should be less than 15MB")
      end
    end
end
