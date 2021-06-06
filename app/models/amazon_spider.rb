class AmazonSpider < Kimurai::Base
  @name = "amazon_spider"
  @engine = :mechanize
  @start_urls = ["https://www.amazon.com/Seagate-Portable-External-Hard-Drive/dp/B07CRG94G3/ref=lp_16225009011_1_8"]

  def parse(response, url:, data: {})
    item = {}
    item[:title] = response.xpath("//span[@id='productTitle']").text
    return item
  end
end