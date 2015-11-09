class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :domains, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :pages, dependent: :destroy
  has_many :photos, through: :projects

  accepts_nested_attributes_for :domains

  def build_empty_domains(number)
    number.times do
      self.domains.new
    end
    self
  end
end
