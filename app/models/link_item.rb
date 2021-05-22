class LinkItem < ApplicationRecord
  belongs_to :user
  belongs_to :product_page
end
