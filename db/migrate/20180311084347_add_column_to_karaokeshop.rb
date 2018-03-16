class AddColumnToKaraokeshop < ActiveRecord::Migration[5.1]
  def change
    add_column :karaoke_shops, :tax_include, :boolean
    add_column :freetime_data, :weekday_dayfree1_start_limittime, :datetime
    add_column :freetime_data, :weekday_dayfree2_start_limittime, :datetime
    add_column :freetime_data, :weekday_nightfree1_start_limittime, :datetime
    add_column :freetime_data, :weekday_nightfree2_start_limittime, :datetime
    add_column :freetime_data, :holiday_dayfree1_start_limittime, :datetime
    add_column :freetime_data, :holiday_dayfree2_start_limittime, :datetime
    add_column :freetime_data, :holiday_nightfree1_start_limittime, :datetime
    add_column :freetime_data, :holiday_nightfree2_start_limittime, :datetime
  end
end
