class Rule < ApplicationRecord
  belongs_to :user 
  mount_uploader :picture, PictureUploader
  
  validate  :picture_size
  validates :user_id, presence: true
  
  private

    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 15.megabytes
        errors.add(:picture, "should be less than 15MB")
      end
    end
 
end
