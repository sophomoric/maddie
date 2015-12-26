module HostHelper
  def set_host(host)
    default_url_options[:host] = host
    Capybara.app_host = "http://" + host
  end

  def user_at_test_domain
    user = create(:user, :with_domain)
    set_host(user.domains.first.host)
    user
  end
end
