class Project < ActiveRecord::Base
  include AttachAvatar
  include Croppable
  validates :title, presence: true, uniqueness: { scope: :user_id }

  belongs_to :user

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
end
