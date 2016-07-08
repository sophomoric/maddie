class Domain < ActiveRecord::Base
  belongs_to :user
  has_many :projects, dependent: :destroy
  has_many :pages, dependent: :destroy
  has_many :photos, through: :projects

  has_one :meta_property_list

  validates :host, uniqueness: true, presence: true
end
