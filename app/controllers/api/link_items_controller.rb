class Api::LinkItemsController < ApplicationController
  def index
    @link_items = current_user.link_items
    render json: @link_items
  end

  def show
    @link_item = LinkItem.find(params[:id])
    render json: @link_item
  end

  def create
    product_page = ProductPage.find_by(slug: params[:slug])
    params = link_item_params
    params[:user_id] = current_user.id
    @link_item = product_page.link_items.new(params)
    if @link_item.save
      render json: @link_item
    else
      render json: {error: @link_item.errors.full_messages}, status: 422
    end
  end

  def update
    @link_item = LinkItem.find(params[:id])
    if @link_item.update(link_item_params)
      render json: @link_item
    else
      render json: {error: @link_item.errors.full_messages}, status: 422
    end
  end

  def destroy
    @link_item = LinkItem.find(params[:id])
    if @link_item.user == current_user
      @link_item.destroy
    else
      render json: {error: "Invalid operation"}, status: 422
    end
  end

  private

  def link_item_params
    params.require(:link_item).permit(:title, :description, :source, :image, :price, :product_page_id, :user_id, :slug)
  end
end
