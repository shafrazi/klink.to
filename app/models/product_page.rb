require 'securerandom'

class ProductPage < ApplicationRecord
  before_validation :create_slug

  belongs_to :user
  has_many :link_items
  has_many :product_page_data

  validates :slug, uniqueness: true

  # create slug for url
  def create_slug
    loop do
      slug = SecureRandom.alphanumeric(5)
      self.slug = slug
      break unless ProductPage.where(slug: slug).exists?
    end
  end

  def weekly_views
    data = product_page_data.group_by_day(:created_at, last: 7).count
    total = 0
    data.each do |_key, value|
      total += value
    end
    total
  end
end
