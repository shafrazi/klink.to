class DropLinkItemDataTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :link_item_data
  end
end
