class Domain < ActiveRecord::Base
  belongs_to :user
  has_many :projects, dependent: :destroy
  has_many :pages, dependent: :destroy
  has_many :photos, through: :projects

  validates :host, uniqueness: true, presence: true
end
