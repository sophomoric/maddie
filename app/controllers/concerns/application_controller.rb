class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def ensure_domain_has_user!
    redirect_to root_url unless user_by_domain
  end

  def user_by_domain
    @user_by_domain ||= domain.try(:user)
  end

  def domain
    @domain ||= Domain.find_by_host(request.host)
  end

  def page_title
    domain.try(:page_title) || "Adrian Rules"
  end

  helper_method :ensure_domain_has_user!, :user_by_domain, :page_title
end
