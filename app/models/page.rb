class Page < ActiveRecord::Base
  RESERVED_WORDS = [
    "pages"
  ]

  validates :title, presence: true
  validates :body, presence: true
  validates :order, presence: true, uniqueness: { scope: :domain_id }
  validates(
    :url_key,
    presence: true,
    uniqueness: { scope: :domain_id },
    exclusion: { in: RESERVED_WORDS }
  )

  belongs_to :domain
  belongs_to :user
end
