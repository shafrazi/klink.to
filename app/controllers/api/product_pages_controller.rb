class Api::ProductPagesController < ApplicationController
  before_action :authenticate_user
  def index
    @product_pages = current_user.product_pages
    render json: @product_pages
  end

  def create
    @product_page = current_user.product_pages.new(product_page_params)
    if @product_page.save
      render json: @product_page
    else
      render json: {errors: @product_page.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @product_page = ProductPage.find(params[:id])
    render json: @product_page
  end

  def update
    @product_page = ProductPage.find(params[:id])
    if @product_page.update(product_page_params)
      render json: @product_page
    else
      render json: {errors: @product_page.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @product_page = ProductPage.find(params[:id])
    @product_page.destroy
  end

  private

  def product_page_params
    params.require(:product_page).permit(:title, :user_id, :description, :url)
  end
end
