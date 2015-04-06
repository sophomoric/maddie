class Project < ActiveRecord::Base
  include AttachAvatar
  include Croppable
  validates :title, presence: true, uniqueness: true

  has_and_belongs_to_many :media

  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos

  def self.build
    project = self.new
    10.times do
      project.photos.new
    end
    project
  end

  def cover_photo
    photo_url || avatar.url
  end
end
