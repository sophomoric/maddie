class Page < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true
  validates :order, presence: true, uniqueness: { scope: :user_id }
  validates :url_key, presence: true, uniqueness: { scope: :user_id }

  belongs_to :user
end
