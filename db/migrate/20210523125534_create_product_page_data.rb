class CreateProductPageData < ActiveRecord::Migration[6.1]
  def change
    create_table :product_page_data do |t|
      t.datetime :date
      t.references :ahoy_visit, null: false, foreign_key: true
      t.references :product_page, null: false, foreign_key: true

      t.timestamps
    end
  end
end
