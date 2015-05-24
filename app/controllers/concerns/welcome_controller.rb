class WelcomeController < ApplicationController
  def index
  end

  def show
    @page = Page.find_by_url_key(params[:url_key])
    raise ActiveRecord::RecordNotFound unless @page
  end
end
