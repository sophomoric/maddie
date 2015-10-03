class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def user_by_domain
    @user_by_domain ||= User.find_by_domain(request.host) || User.new
  end

  def page_title
    user_by_domain.domain.try(:split, ".").try(:[], 1) || "Adrian Rules"
  end

  helper_method :user_by_domain, :page_title
end
