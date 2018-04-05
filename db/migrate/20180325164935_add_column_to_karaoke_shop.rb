class AddColumnToKaraokeShop < ActiveRecord::Migration[5.1]
  def change
    add_column :karaoke_shops, :area_id, :integer
  end
end
