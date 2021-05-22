class Api::ProductPagesController < ApplicationController
  before_action :authenticate_user
  def index
    @product_pages = current_user.product_pages
    render json: @product_pages
  end
end
