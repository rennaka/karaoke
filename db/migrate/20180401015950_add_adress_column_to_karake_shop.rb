class AddAdressColumnToKarakeShop < ActiveRecord::Migration[5.1]
  def change
    add_column :karaoke_shops, :address, :string
  end
end
