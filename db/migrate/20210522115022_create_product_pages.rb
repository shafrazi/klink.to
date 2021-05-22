class CreateProductPages < ActiveRecord::Migration[6.1]
  def change
    create_table :product_pages do |t|
      t.references :user, null: false, foreign_key: true
      t.string :url
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
