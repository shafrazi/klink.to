class ProductPage < ApplicationRecord
  belongs_to :user
  has_many :link_items
end
