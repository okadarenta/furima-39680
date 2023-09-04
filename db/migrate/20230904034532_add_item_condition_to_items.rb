class AddItemConditionToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :item_condition_id, :integer, null: false
  end
end
