class LinkItem < ApplicationRecord
  belongs_to :user
  belongs_to :product_page
  has_many :link_item_data
end
