class PageOrderer
  def initialize(user)
    @user = user
  end

  def pages
    if user
      user.pages.order(:order)
    else
      []
    end
  end

  def visible_pages
    if pages.blank?
      []
    else
      pages.where(hidden: false)
    end
  end

  def next_page
    order = pages.any? ? pages.maximum(:order) + 1 : 1
    user.pages.new(order: order)
  end

  def page_after(page)
    user.pages.find_by_order(page.order + 1) || pages.first
  end

  def page_before(page)
    user.pages.find_by_order(page.order - 1) || pages.last
  end

  private

  attr_reader :user
end
