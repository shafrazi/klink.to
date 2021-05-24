require "securerandom"

class ProductPage < ApplicationRecord
  before_validation :create_slug

  belongs_to :user
  has_many :link_items
  has_many :product_page_data

  validates :slug, uniqueness: true

  def create_slug
    loop do
      slug = SecureRandom.alphanumeric(5)
      self.slug = slug
      break unless ProductPage.where(slug: slug).exists?
    end
  end
end
