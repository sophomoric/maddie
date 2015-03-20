class Page < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true
  validates :order, presence: true, uniqueness: true
  validates :url_key, presence: true, uniqueness: true

  def self.ordered_pages
    Page.all.order(:order)
  end

  def self.next_page
    if Page.any?
      order = ordered_pages.last.order + 1
    else
      order = 0
    end

    Page.new(order: order)
  end
end
