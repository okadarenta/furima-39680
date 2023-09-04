class AddItemShippingIdToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :item_shipping_id, :integer, null: false
  end
end
