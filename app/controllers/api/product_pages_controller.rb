class Api::ProductPagesController < ApplicationController
  before_action :authenticate_user
  def index
    @product_pages = current_user.product_pages
    render json: { pages: ProductPageSerializer.new(@product_pages).serializable_hash }
  end

  def create
    @product_page = current_user.product_pages.new(product_page_params)
    if @product_page.save
      render json: @product_page
    else
      render json: { errors: @product_page.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @product_page = ProductPage.find_by(slug: params[:slug])

    if @product_page
      datum = @product_page.product_page_data.create
      render json: { page: @product_page, data: datum.ahoy_visit,
                     count: ProductPageDatum.joins(:ahoy_visit).group('city').count, link_items: @product_page.link_items }
    else
      render json: { errors: 'Invalid request' }, status: :unprocessable_entity
    end
  end

  def update
    @product_page = ProductPage.find_by(slug: params[:slug])
    if authorize_user(@product_page)
      if @product_page.update(product_page_params)
        render json: @product_page
      else
        render json: { errors: @product_page.errors.full_messages }, status: :unprocessable_entity
      end
    else
      head :unauthorized
    end
  end

  def destroy
    @product_page = ProductPage.find_by(slug: params[:slug])
    if authorize_user(@product_page)
      @product_page.destroy
    else
      head :unauthorized
    end
  end

  private

  def product_page_params
    params.require(:product_page).permit(:title, :user_id, :description, :url)
  end

  def views_this_week
    total = 0
    current_user.product_page_data.group_by_day(:created_at, last: 7).count.each do |_key, value|
      total += value
    end
    total
  end
end
