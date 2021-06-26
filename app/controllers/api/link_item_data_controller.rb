class Api::LinkItemDataController < ApplicationController
  def create
    @link_item_datum = LinkItemDatum.new(link_item_datum_params)
    if @link_item_datum.save
      render json: @link_item_datum
    else
      render json: { errors: @link_item_datum.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def link_item_datum_params
    params.require(:link_item_datum).permit(:link_item_id)
  end
end
