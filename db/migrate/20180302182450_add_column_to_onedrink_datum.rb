class AddColumnToOnedrinkDatum < ActiveRecord::Migration[5.1]
  def change
    add_column :onedrink_data, :karaoke_shop_id, :integer
  end
end
