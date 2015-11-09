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

  def next_page
    order = pages.any? ? pages.maximum(:order) + 1 : 1
    user.pages.new(order: order)
  end

  private

  attr_reader :user
end
