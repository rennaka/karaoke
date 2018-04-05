class AddUrlColumnToKaraokeShops < ActiveRecord::Migration[5.1]
  def change
    add_column :karaoke_shops, :url_st, :string
    add_column :karaoke_shops, :url_te, :text
  end
end
