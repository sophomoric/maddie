class PageOrderer
  def initialize(pages)
    @pages = pages
  end

  def visible_pages
    @_visible_pages ||= pages.visible.ordered
  end

  def new_page
    pages.new(order: next_page_number)
  end

  def page_after(page)
    visible_pages.pages_after(page).first ||
      visible_pages.first
  end

  def page_before(page)
    visible_pages.pages_before(page).last ||
      visible_pages.last
  end

  private

  attr_reader :pages

  def next_page_number
    1 + (highest_visible_page_number || 0)
  end

  def highest_visible_page_number
    visible_pages.maximum(:order)
  end
end
