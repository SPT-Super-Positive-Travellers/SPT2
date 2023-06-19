class RenameGenreIdColumnToItems < ActiveRecord::Migration[6.1]
  def change
    rename_column :items, :genre_id, :item_genre_id
  end
end
