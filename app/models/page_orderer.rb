class PageOrderer
  def initialize(domain)
    @domain = domain
    raise unless domain
  end

  def visible_pages
    ordered_pages.where(hidden: false)
  end

  def next_page
    order = if visible_pages.any?
              visible_pages.maximum(:order) + 1
            else
              1
            end
    domain.pages.new(order: order)
  end

  def page_after(page)
    visible_pages.where("pages.order > ?", page.order).first ||
      visible_pages.first
  end

  def page_before(page)
    visible_pages.where("pages.order < ?", page.order).last ||
      visible_pages.last
  end

  private

  attr_reader :domain

  def ordered_pages
    @ordered_pages ||= domain.pages.order(:order)
  end
end
