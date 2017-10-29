class Post < ApplicationRecord
  mount_uploader :picture, PictureUploader
  after_save :format_tags
  acts_as_taggable

  validates :title, presence: true
  validates :picture, presence: true

  belongs_to :user

  before_destroy :delete_picture_from_cloud

  scope :desc, -> {order("created_at DESC")}

  def format_tags
    if self.tag_list
      self.tag_list = self.tag_list.each {|t| t.gsub!(/\s/, '_')}
      self.tag_list = self.tag_list.each {|t| t.gsub!(/[^0-9A-Za-z_]/, '')}
    end
  end

  def delete_picture_from_cloud
    if self.picture.file && id = self.picture.file.public_id
      Cloudinary::Uploader.destroy(id)
    end
  end
end
