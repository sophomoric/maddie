class Users::SessionsController < Devise::SessionsController
  def create
    if !user_has_domain? || correct_domain?
      super
    else
      redirect_to new_user_session_path, alert: "Wrong domain for user!"
    end
  end

  private

  def user_has_domain?
    User.find_by_email(email).try(:domain).present?
  end

  def correct_domain?
    user_by_domain.try(:email) == email
  end

  def email
    params[:user][:email]
  end
end
