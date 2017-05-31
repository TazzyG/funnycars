class Sponsor < ApplicationRecord
  belongs_to :user
  
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  
  validates :company_name, presence: true, length: { maximum: 140 }
  
  def full_name
    [first_name.capitalize, last_name.capitalize].compact.join(' ')
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
