require "open-uri"
require "selenium-webdriver"
require "mechanize"
class Api::ScrapesController < ApplicationController
  # user enters url
  # identify domain and appropriate action to route
  # if amazon run relevant function and run scrape action
  # render json data of fetched details of item
  # populate the front end form with rendered data
  # if correct let user to submit data and create product link

  def scrape
    url = params[:url]
    domain = Domainatrix.parse(url).domain
    
    if domain === 'amazon' 
      # response = AmazonSpider.process(url)
      response = AmazonSpider.parse!(:parse, url: url)
      render json: {data: response}
    end
  end
end
