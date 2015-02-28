class Page < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true
  validates :order, presence: true, uniqueness: true
end
