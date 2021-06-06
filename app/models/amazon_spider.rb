class AmazonSpider < Kimurai::Base
  @name = "amazon_spider"
  @engine = :mechanize
  
  def self.process(url)
    @start_urls = [url]
    self.crawl!
  end

  def parse(response, url:, data: {})
    item = {}
    item[:title] = response.xpath("//span[@id='productTitle']").text.squish
    item[:price] = response.xpath("//span[@id='price_inside_buybox']").text.squish
    item[:description] = response.xpath("//div[@id='feature-bullets']").text.squish
    item[:image] = response.at_css('#landingImage').attr("src")
    return item
  end
end