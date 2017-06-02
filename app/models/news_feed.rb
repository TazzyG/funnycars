class NewsFeed < ApplicationRecord
  
  belongs_to :user
  
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 60 }
  validates :picture, presence: true
  validates :content, presence: true, length: { maximum: 4500 }
  
  validate  :picture_size
  private

    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 15.megabytes
        errors.add(:picture, "should be less than 15MB")
      end
    end
end
