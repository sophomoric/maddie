class OrderSwapsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @pages = PageOrderer.new(current_user_domain).visible_pages
  end

  def create
    if OrderSwap.new(order_swap_params, current_user_domain).save
      flash[:messages] = ["Order Swapped!"]
    else
      flash[:errors] = ["Failed to swap the order :( "]
    end
    redirect_to :back
  end

  private

  def order_swap_params
    params.require(:order_swap)
  end
end
