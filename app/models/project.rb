class Project < ActiveRecord::Base
  include AttachAvatar
  include Croppable
  validates :title, presence: true, uniqueness: { scope: :user_id }
  validates :url_key, presence: true, uniqueness: { scope: :user_id }

  belongs_to :user
  belongs_to :domain

  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos

  def self.build
    project = self.new
    10.times do
      project.photos.new
    end
    project
  end

  def to_param
    url_key
  end
end
