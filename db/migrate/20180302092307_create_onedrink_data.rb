class CreateOnedrinkData < ActiveRecord::Migration[5.1]
  def change
    create_table :onedrink_data do |t|
      t.boolean :weekday_day
      t.boolean :holiday_day
      t.boolean :weekday_night
      t.boolean :holiday_night
      t.boolean :weekday_dayfree1
      t.boolean :holiday_dayfree1
      t.boolean :weekday_dayfree2
      t.boolean :holiday_dayfree2
      t.boolean :weekday_nightfree1
      t.boolean :holiday_nightfree1
      t.boolean :weekday_nightfree2
      t.boolean :holiday_nightfree2

      t.timestamps
    end
  end
end
