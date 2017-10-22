class Post < ApplicationRecord
  has_many :taggings
  has_many :tags, through: :taggings
  mount_uploader :picture, PictureUploader

  validates :title, presence: true
  validates :picture, presence: true
end
