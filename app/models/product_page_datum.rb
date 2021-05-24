class ProductPageDatum < ApplicationRecord  
  belongs_to :product_page
  visitable :ahoy_visit 
end
