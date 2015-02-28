class PagesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @page = Page.new
    @pages = Page.all
  end

  def create
    @page = Page.new(page_params)
    redirect_to :back
  end

  def update
    @page = Page.find(params[:id])
    @page.update(page_params)
    redirect_to :back
  end

  def destroy
    page = Page.find(params[:id])
    page.destroy
    redirect_to :back
  end

  private

  def page_params
    params.require(:page).permit(:title, :body, :order)
  end
end
