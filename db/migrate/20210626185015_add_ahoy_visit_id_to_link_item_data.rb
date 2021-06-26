class AddAhoyVisitIdToLinkItemData < ActiveRecord::Migration[6.1]
  def change
    add_column :link_item_data, :ahoy_visit_id, :bigint, null: false
  end
end
