class CreateKaraokeShops < ActiveRecord::Migration[5.1]
  def change
    create_table :karaoke_shops do |t|
      t.string :name
      t.integer :day_price
      t.integer :night_price
      t.integer :dayfree1_price
      t.integer :nightfree1_price
      t.time :open_time
      t.time :close_time
      t.time :nightstart_time
      t.time :dayfree1_start_time
      t.time :dayfree1_endtime
      t.time :nightfree1_start_time
      t.time :nightfree1_endtime

      t.timestamps
    end
  end
end
