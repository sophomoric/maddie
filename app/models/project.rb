class Project < ActiveRecord::Base
  
  validates :title, presence: true, uniqueness: true
  
  has_and_belongs_to_many :media
  has_many :photos, dependent: :destroy
  
  def generate_photo_url
    #make defualt url
    if self.photo_url
      self.photo_url
    else
      self.photo_url = self.photos.first.suggested_photo_based_on_size
      self.save
      self.photo_url
    end
  end
  
  def default_photo_url
    "http://s3.amazonaws.com/rebulba_dev/users/avatars/000/000/007/original/puppy.jpg?1398551275"
  end
end
