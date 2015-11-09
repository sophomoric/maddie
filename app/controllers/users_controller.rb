class UsersController < ApplicationController
  before_filter :authenticate_user!

  def edit
    @user = current_user.build_empty_domains(2)
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to :back
  end

  private

  def user_params
    all_params = params.
      require(:user).
      permit(domains_attributes: [:id, :host, :page_title])

    all_params[:domains_attributes].reject! do |_k, value|
      value[:host].blank?
    end

    all_params
  end
end
