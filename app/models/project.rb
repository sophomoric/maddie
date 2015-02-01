class Project < ActiveRecord::Base
  include AttachAvatar
  include Croppable
  validates :title, presence: true, uniqueness: true

  has_and_belongs_to_many :media

  has_many :photos, dependent: :destroy
  # accepts_nested_attributes_for :photos

  def cover_photo
    photo_url || avatar.url
  end

  def default_photo_url
    "http://s3.amazonaws.com/rebulba_dev/users/avatars/000/000/007/original/puppy.jpg?1398551275"
  end
end
