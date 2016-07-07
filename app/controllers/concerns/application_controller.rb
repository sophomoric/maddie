class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def ensure_domain_has_user!
    redirect_to new_domain_url unless user_by_domain
  end

  def user_by_domain
    @user_by_domain ||= domain.try(:user)
  end

  def current_user_domain
    @current_user_domain ||=
      current_user && current_user.domains.where(host: request.host).first
  end

  def domain
    @domain ||= Domain.find_by_host(request.host)
  end

  def page_title
    domain.try(:page_title) || "Adrian Rules"
  end

  helper_method(
    :domain,
    :current_user_domain,
    :ensure_domain_has_user!,
    :user_by_domain,
    :page_title
  )
end
