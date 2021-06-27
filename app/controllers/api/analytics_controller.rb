class Api::AnalyticsController < ApplicationController
  skip_before_action :track_ahoy_visit
  # when a page is being visited a Visit is created.
  # getting all visit data for a page

  def overview
    data = {
      all_page_traffic: all_page_traffic,
      all_views: all_views,
      page_count: current_user.product_pages.count,
      link_count: current_user.link_items.count,
      link_view_count: current_user.link_item_data.count
    }

    render json: data
  end

  def traffic_percentage
    data = device_traffic(params[:id])
    render json: get_percentage(data)
  end

  def all_page_traffic
    page_data = current_user.product_page_data.joins(:ahoy_visit).group('device_type').count
    get_percentage(page_data)
  end

  def all_views
    views = current_user.product_page_data.count
  end

  private

  def get_percentage(data)
    total_count = 0
    data.each do |_key, value|
      total_count += value
    end

    output = {}
    data.each do |key, value|
      if !key
        output['Other'] = ((value.to_f / total_count) * 100).round
      else
        output[key] = ((value.to_f / total_count) * 100).round
      end
    end

    output
  end

  def device_traffic(page_id)
    data = ProductPageDatum.where('product_page_id = ?', page_id).joins(:ahoy_visit).group('device_type').count
  end
end
