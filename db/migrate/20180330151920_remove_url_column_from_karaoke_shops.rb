class RemoveUrlColumnFromKaraokeShops < ActiveRecord::Migration[5.1]
  def change
    remove_column :karaoke_shops, :url_st
    remove_column :karaoke_shops, :url_te
  end
end
