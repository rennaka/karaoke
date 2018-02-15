class RemoveColumnsFromJaraokeshop < ActiveRecord::Migration[5.1]
  def change
    remove_column :karaoke_shops, :day_price
    remove_column :karaoke_shops, :night_price
    remove_column :karaoke_shops, :dayfree1_price
    remove_column :karaoke_shops, :nightfree1_price
    remove_column :karaoke_shops, :open_time
    remove_column :karaoke_shops, :close_time
    remove_column :karaoke_shops, :nightstart_time
    remove_column :karaoke_shops, :dayfree1_start_time
    remove_column :karaoke_shops, :dayfree1_endtime
    remove_column :karaoke_shops, :nightfree1_start_time
    remove_column :karaoke_shops, :nightfree1_endtime
  end
end
