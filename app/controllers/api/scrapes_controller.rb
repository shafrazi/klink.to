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
    
    # if domain === 'amazon' 
      # AmazonSpider.url(url)
      # response = AmazonSpider.parse!(:parse, url: url)
      data = get_data(url)
      render html: data
    # end
  end

  private

  def get_data(url)
    # driver = Selenium::WebDriver.for :mechanize
    # driver.get(url)
    # doc = Nokogiri::HTML(driver.page_source)
    # return doc.css("title")
    agent = Mechanize.new
    page = agent.get(url)
    return page
  end
end
