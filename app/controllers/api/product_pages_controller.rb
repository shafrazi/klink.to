class Api::ProductPagesController < ApplicationController
  before_action :authenticate_user
  def index
    @product_pages = current_user.product_pages
    render json: {pages: @product_pages, visits: current_visit, user: current_user}
  end

  def create
    @product_page = current_user.product_pages.new(product_page_params)
    if @product_page.save
      render json: @product_page
    else
      render json: {errors: @product_page.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def new
    render json: {visit: current_visit, data: current_visit.product_page_data}
  end

  def show
    @product_page = ProductPage.find_by(slug: params[:slug])
    datum = @product_page.product_page_data.create()
    render json: {page: @product_page, data: datum.ahoy_visit, count: ProductPageDatum.joins(:ahoy_visit).group("city").count, link_items: @product_page.link_items}
  end

  def update
    @product_page = ProductPage.find_by(slug: params[:slug])
    if @product_page.update(product_page_params)
      render json: @product_page
    else
      render json: {errors: @product_page.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @product_page = ProductPage.find_by(slug: params[:slug])
    @product_page.destroy
  end

  private

  def product_page_params
    params.require(:product_page).permit(:title, :user_id, :description, :url)
  end
end
