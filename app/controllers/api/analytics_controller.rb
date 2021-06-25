class Api::AnalyticsController < ApplicationController
  # when a page is being visited a Visit is created.
  # getting all visit data for a page
  #
  def device_traffic(page_id)
    data = ProductPageDatum.where('product_page_id = ?', page_id).joins(:ahoy_visit).group('device_type').count
  end

  def traffic_percentage
    data = device_traffic(params[:id])

    total_traffic = 0
    data.each do |_device_type, count|
      total_traffic += count
    end

    traffic_data = {}
    data.each do |device_type, count|
      traffic_data[device_type] = (count.to_f / total_traffic) * 100
    end

    render json: { traffic: traffic_data }
  end
end
