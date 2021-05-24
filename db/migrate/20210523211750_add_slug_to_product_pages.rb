class AddSlugToProductPages < ActiveRecord::Migration[6.1]
  def change
    add_column :product_pages, :slug, :string
  end
end
