class LinkItemDatum < ApplicationRecord
  belongs_to :link_item
  visitable :ahoy_visit
end
