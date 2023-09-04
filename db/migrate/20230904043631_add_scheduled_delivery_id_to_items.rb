class AddScheduledDeliveryIdToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :scheduled_delivery_id, :integer,  null: false
  end
end
