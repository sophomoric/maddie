class WelcomeController < ApplicationController
  def index
    if user_needs_domain?
      flash[:messages] = ["You need at least one domain"]
      redirect_to edit_user_path(current_user)
    elsif domain
      @pages = PageOrderer.new(domain).visible_pages
    else
      redirect_to new_user_session_path
    end
  end

  def show
    if user_needs_domain?
      flash[:messages] = ["You need at least one domain"]
      redirect_to edit_user_path(current_user)
    elsif domain
      @page = domain.pages.find_by_url_key(params[:url_key])
      raise ActiveRecord::RecordNotFound unless @page
    else
      redirect_to new_user_session_path
    end
  end

  private

  def user_needs_domain?
    !!current_user && !domain
  end
end
