class PagesController < ApplicationController
  before_filter :authenticate_user!
  def new
    @page = PageOrderer.new(user_by_domain).next_page
  end

  def index
    @page = PageOrderer.new(user_by_domain).next_page
    render_pages
  end

  def create
    @page = current_user.pages.new(page_params)
    if @page.save
      flash[:messages] = ["Page Saved"]
      redirect_to pages_url
    else
      flash[:messages] = @page.errors.full_messages
      render :new
    end
  end

  def edit
    @page = current_user.pages.find(params[:id])
  end

  def update
    @page = current_user.pages.find(params[:id])
    if @page.update(page_params)
      flash[:messages] = ["Page Updated"]
      redirect_to pages_url
    else
      flash[:messages] = @page.errors.full_messages
      render :edit
    end
  end

  def destroy
    page = current_user.pages.find(params[:id])
    page.destroy
    redirect_to pages_url
  end

  private

  def render_pages
    @pages = PageOrderer.new(user_by_domain).pages
    render "index"
  end

  def page_params
    params.require(:page).permit(:title, :body, :order, :url_key)
  end
end
