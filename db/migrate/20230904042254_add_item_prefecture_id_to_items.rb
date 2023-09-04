class AddItemPrefectureIdToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :item_prefecture_id, :integer,  null: false
  end
end
