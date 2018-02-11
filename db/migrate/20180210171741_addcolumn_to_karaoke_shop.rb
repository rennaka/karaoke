class AddcolumnToKaraokeShop < ActiveRecord::Migration[5.1]
  def change
    add_column :karaoke_shops, :karaoke_kind_id, :integer
  end
end
