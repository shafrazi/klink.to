class AmazonSpider < Kimurai::Base
  @name = 'amazon_spider'
  @engine = :mechanize

  def self.process(url)
    @start_urls = [url]
    crawl!
  end

  def parse(response, url:, data: {})
    data = { item: {}, is_complete: false }

    if response.at_css('title').text.include?('Books')
      data[:item][:title] = response.xpath("//span[@id='productTitle']").text.squish
      data[:item][:price] = response.xpath("//span[@id='price']").text.squish
      data[:item][:description] = response.xpath("//div[@id='iframeContent']").text.squish
      data[:item][:image] = response.at_css('#imgBlkFront').attr('src') if response.at_css('#imgBlkFront')
    else
      data[:item][:title] = response.xpath("//span[@id='productTitle']").text.squish
      data[:item][:price] = response.xpath("//span[@id='price_inside_buybox']").text.squish
      data[:item][:description] = response.xpath("//div[@id='feature-bullets']").text.squish
      data[:item][:image] = response.at_css('#landingImage').attr('src') if response.at_css('#landingImage')
    end
    data[:is_complete] = true if data[:item][:title] && data[:item][:price] && data[:item][:description]

    data
  end
end
