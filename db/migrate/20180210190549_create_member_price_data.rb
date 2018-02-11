class CreateMemberPriceData < ActiveRecord::Migration[5.1]
  def change
    create_table :member_price_data do |t|
      t.integer :weekday_day_price
      t.integer :holiday_day_price
      t.integer :weekday_night_price
      t.integer :holiday_night_price
      t.integer :weekday_dayfree1_price
      t.integer :holiday_dayfree1_price
      t.integer :weekday_nightfree1_price
      t.integer :holiday_nightfree1_price
      t.integer :weekday_dayfree2_price
      t.integer :holiday_dayfree2_price
      t.integer :weekday_nightfree2_price
      t.integer :holiday_nightfree2_price
      t.integer :karaoke_shop_id

      t.timestamps
    end
  end
end
