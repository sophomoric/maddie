class Project < ActiveRecord::Base
  
  validates :title, presence: true, uniqueness: true
  
  has_and_belongs_to_many :media
  has_many :photos, dependent: :destroy
end
