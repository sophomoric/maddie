class MetaPropertyListsController < ApplicationController
  def new
    existing_list = current_user_domain.try(:meta_property_list)
    if existing_list
      redirect_to edit_meta_property_list_path(existing_list)
    else
      @meta_property_list = MetaPropertyList.new
    end
  end

  def create
    @meta_property_list =
      MetaPropertyList.new(meta_property_list_params)
    @meta_property_list.domain_id = current_user_domain.id
    if @meta_property_list.save
      redirect_to edit_meta_property_list_path(@meta_property_list)
      flash[:messages] = ["Success"]
    else
      flash[:errors] = @meta_property_list.errors
      render "new"
    end
  end

  def edit
    @meta_property_list = current_user_domain.meta_property_list
    if @meta_property_list
      render :edit
    else
      redirect_to new_meta_property_list_path
    end
  end

  def update
    @meta_property_list = current_user_domain.meta_property_list
    if @meta_property_list.update(meta_property_list_params)
      flash[:messages] = ["Success"]
      redirect_to edit_meta_property_list_path(@meta_property_list)
    else
      flash[:errors] = @meta_property_list_params.errors
      render :edit
    end
  end

  private

  def meta_property_list_params
    params.
      require(:meta_property_list).
      permit(:og_image, :og_title, :og_url, :root_content)
  end
end
