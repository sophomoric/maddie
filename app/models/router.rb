class Router
  include Rails.application.routes.url_helpers

  def self.default_url_options
    ActionMailer::Base.default_url_options
  end

  def page_url(page)
    if page.url_key.present?
      "#{pages_url}/#{(page.url_key)}"
    else
      root_url
    end
  end
end
