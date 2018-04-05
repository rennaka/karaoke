class AddColumnToKaraokeShops < ActiveRecord::Migration[5.1]
  def change
    add_column :karaoke_shops, :url, :string
  end
end
