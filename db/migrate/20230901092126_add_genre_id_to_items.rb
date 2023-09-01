class AddGenreIdToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :genre_id, :integer
  end
end
