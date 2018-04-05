class RenameColumnToKaraokeshop < ActiveRecord::Migration[5.1]
  def change
    rename_column :karaoke_shops, :url, :homepage_link
  end
end
