class Users::SessionsController < Devise::SessionsController
  def create
    if user_by_domain.email != email
      redirect_to new_user_session_path, alert: "Wrong domain for user!"
    else
      super
    end
  end

  private

  def email
    params[:user][:email]
  end
end
