class ChangColumnToMemberPrice < ActiveRecord::Migration[5.1]
  def change
    change_column_default :member_price_data, :weekday_day_price, 0
    change_column_default :member_price_data, :weekday_night_price, 0
    change_column_default :member_price_data, :holiday_day_price, 0
    change_column_default :member_price_data, :holiday_night_price, 0
  end
end
