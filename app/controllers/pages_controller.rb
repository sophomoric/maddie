class PagesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @page = Page.new
    render_pages
  end

  def create
    @page = Page.new(page_params)
    @page.save
    render_pages
  end

  def update
    @page = Page.find(params[:id])
    @page.update(page_params)
    render_pages
  end

  def destroy
    page = Page.find(params[:id])
    page.destroy
    render_pages
  end

  private

  def render_pages
    @pages = Page.all
    render "index"
  end

  def page_params
    params.require(:page).permit(:title, :body, :order)
  end
end
