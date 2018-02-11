class CreateFreetimeData < ActiveRecord::Migration[5.1]
  def change
    create_table :freetime_data do |t|
      t.time :weekday_dayfree1_starttime
      t.time :weekday_dayfree1_endtime
      t.integer :weekday_dayfree1_limittime
      t.time :weekday_dayfree2_starttime
      t.time :weekday_dayfree2_endtime
      t.integer :weekday_dayfree2_limittime
      t.time :weekday_nightfree1_starttime
      t.time :weekday_nightfree1_endtime
      t.integer :weekday_nightfree1_limittime
      t.time :weekday_nightfree2_starttime
      t.time :weekday_nightfree2_endtime
      t.integer :weekday_nightfree2_limittime
      t.time :holiday_dayfree1_starttime
      t.time :holiday_dayfree1_endtime
      t.integer :holiday_dayfree1_limittime
      t.time :holiday_dayfree2_starttime
      t.time :holiday_dayfree2_endtime
      t.integer :holiday_dayfree2_limittime
      t.time :holiday_nightfree1_starttime
      t.time :holiday_nightfree1_endtime
      t.integer :holiday_nightfree1_limittime
      t.time :holiday_nightfree2_starttime
      t.time :holiday_nightfree2_endtime
      t.integer :holiday_nightfree2_limittime

      t.timestamps
    end
  end
end
