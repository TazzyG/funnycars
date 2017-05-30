class Team < ApplicationRecord
  belongs_to :user
  has_many :team_infos
  has_many :articles
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :team_name, presence: true, length: { maximum: 140 }
  
  validate  :picture_size
  private

    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 15.megabytes
        errors.add(:picture, "should be less than 15MB")
      end
    end
 
end
