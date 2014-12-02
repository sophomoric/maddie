class Project < ActiveRecord::Base
  include AttachAvatar
  include Croppable
  validates :title, presence: true, uniqueness: true
  
  has_and_belongs_to_many :media
  has_many :photos, dependent: :destroy
  after_create :generate_photo_url
  
  def generate_photo_url
    if !photos?
      default_photo_url
    elsif !photo_url?
      self.photo_url = photos.first.suggested_photo_based_on_size
      save!
      photo_url
    else
      photo_url
    end
  end
  
  def default_photo_url
    "http://s3.amazonaws.com/rebulba_dev/users/avatars/000/000/007/original/puppy.jpg?1398551275"
  end
  private
  
  def photos?
    photos.any?
  end
  
  def photo_url?
    !!photo_url
  end
end
