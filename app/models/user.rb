class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :projects
  has_many :pages
  has_many :photos, through: :projects

  validates :domain, uniqueness: true, allow_blank: true
end
