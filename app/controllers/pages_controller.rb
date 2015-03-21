class PagesController < ApplicationController
  before_filter :authenticate_user!
  def new
    @page = Page.next_page
  end

  def index
    @page = Page.next_page
    render_pages
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:messages] = ["Page Saved"]
      redirect_to pages_url
    else
      flash[:messages] = @page.errors.full_messages
      render :new
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if @page.update(page_params)
      flash[:messages] = ["Page Updated"]
      redirect_to pages_url
    else
      flash[:messages] = @page.errors.full_messages
      render :edit
    end
  end

  def destroy
    page = Page.find(params[:id])
    page.destroy
    redirect_to pages_url
  end

  private

  def render_pages
    @pages = Page.ordered_pages
    render "index"
  end

  def page_params
    params.require(:page).permit(:title, :body, :order, :url_key)
  end
end
