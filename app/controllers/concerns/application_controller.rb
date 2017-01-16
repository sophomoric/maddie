class ApplicationController < ActionController::Base
  force_ssl if: :ssl_configured?
  protect_from_forgery with: :exception
  before_filter :authenticate_protected_page!

  def authenticate_protected_page!
    authenticate_user! if protected_domain?
  end

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
    @domain ||= Domain.includes(:meta_property_list).find_by_host(request.host)
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

  def ssl_configured?
    Rails.env.production?
  end

  private

  def protected_domain?
    domain.try(:meta_property_list).try(:password_protected?)
  end
end
