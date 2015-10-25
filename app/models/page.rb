class Page < ActiveRecord::Base
  RESERVED_WORDS = [
    "pages"
  ]

  validates :title, presence: true
  validates :body, presence: true
  validates :order, presence: true, uniqueness: { scope: :user_id }
  validates(
    :url_key,
    presence: true,
    uniqueness: { scope: :user_id },
    exclusion: { in: RESERVED_WORDS }
  )

  belongs_to :user
end
