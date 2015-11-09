class Domain < ActiveRecord::Base
  belongs_to :user

  validates :host, uniqueness: true, presence: true
end
