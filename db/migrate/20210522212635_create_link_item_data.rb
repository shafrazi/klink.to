class CreateLinkItemData < ActiveRecord::Migration[6.1]
  def change
    create_table :link_item_data do |t|
      t.datetime :date
      t.string :ip_address
      t.references :link_item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
