class WelcomeController < ApplicationController
  before_filter :ensure_domain_has_user!, only: [:show]

  def index
    @pages = PageOrderer.new(user_by_domain).pages
  end

  def show
    @page = user_by_domain.pages.find_by_url_key(params[:url_key])
    raise ActiveRecord::RecordNotFound unless @page
  end
end
