class Post < ApplicationRecord
  belongs_to :user
  mount_uploader :picture, PictureUploader
  validates :title, presence: true, length: {minimum:20, maximum:500}
  validates :picture, presence: true
  validates :description, presence: true, length: {minimum: 100, maximum: 1000}

end
