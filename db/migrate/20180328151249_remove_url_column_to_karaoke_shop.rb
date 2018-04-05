class RemoveUrlColumnToKaraokeShop < ActiveRecord::Migration[5.1]
  def change
    remove_column :karaoke_shops, :homepage_link
  end
end
