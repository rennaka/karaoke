class AddHpColumnToKaraokeShop < ActiveRecord::Migration[5.1]
  def change
    add_column :karaoke_shops, :homepage_link, :text
  end
end
