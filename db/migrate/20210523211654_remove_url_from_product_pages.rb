class RemoveUrlFromProductPages < ActiveRecord::Migration[6.1]
  def change
    remove_column :product_pages, :url, :string
  end
end
