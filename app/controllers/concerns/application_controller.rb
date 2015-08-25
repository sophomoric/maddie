class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def user_by_domain
    User.find_by_domain(request.host) || User.new
  end

  helper_method :user_by_domain
end
