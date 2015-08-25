class PageOrderer
  def initialize(user)
    @user = user
  end

  def pages
    user.pages.order(:order)
  end

  def next_page
    order = pages.any? ? pages.maximum(:order) + 1 : 1
    user.pages.new(order: order)
  end

  private

  attr_reader :user
end
