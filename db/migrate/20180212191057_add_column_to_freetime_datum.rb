class AddColumnToFreetimeDatum < ActiveRecord::Migration[5.1]
  def change
    add_column :freetime_data, :karaoke_shop_id, :integer
  end
end
