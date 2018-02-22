class ChangeColumnsToFreetimeData < ActiveRecord::Migration[5.1]
  def change
    change_column :freetime_data, :weekday_dayfree1_starttime, :datetime
    change_column :freetime_data, :weekday_dayfree1_endtime, :datetime
    change_column :freetime_data, :weekday_dayfree2_starttime, :datetime
    change_column :freetime_data, :weekday_dayfree2_endtime, :datetime
    change_column :freetime_data, :holiday_dayfree1_starttime, :datetime
    change_column :freetime_data, :holiday_dayfree1_endtime, :datetime
    change_column :freetime_data, :holiday_dayfree2_starttime, :datetime
    change_column :freetime_data, :holiday_dayfree2_endtime, :datetime
    change_column :freetime_data, :weekday_nightfree1_starttime, :datetime
    change_column :freetime_data, :weekday_nightfree1_endtime, :datetime
    change_column :freetime_data, :weekday_nightfree2_starttime, :datetime
    change_column :freetime_data, :weekday_nightfree2_endtime, :datetime
    change_column :freetime_data, :holiday_nightfree1_starttime, :datetime
    change_column :freetime_data, :holiday_nightfree1_endtime, :datetime
    change_column :freetime_data, :holiday_nightfree2_starttime, :datetime
    change_column :freetime_data, :holiday_nightfree2_endtime, :datetime
    change_column :shoptime_data, :open_time, :datetime
    change_column :shoptime_data, :close_time, :datetime
  end
end
