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
    order = visible_pages.any? ? pages.maximum(:order) + 1 : 1
    user.pages.new(order: order)
  end

  def page_after(page)
    ordered_pages.where("pages.order > ?", page.order).first ||
      ordered_pages.first
  end

  def page_before(page)
    ordered_pages.where("pages.order < ?", page.order).last ||
      ordered_pages.last
  end

  private

  attr_reader :user

  def ordered_pages
    @ordered_pages ||= visible_pages.order(:order)
  end
end
