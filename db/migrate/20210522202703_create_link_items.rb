class CreateLinkItems < ActiveRecord::Migration[6.1]
  def change
    create_table :link_items do |t|
      t.string :title
      t.text :description
      t.string :source
      t.string :image
      t.string :price
      t.references :user, null: false, foreign_key: true
      t.references :product_page, null: false, foreign_key: true

      t.timestamps
    end
  end
end
