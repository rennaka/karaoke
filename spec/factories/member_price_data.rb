FactoryGirl.define do
  factory :member_price_datum do
    weekday_day_price 1
    holiday_day_price 1
    weekday_night_price 1
    holiday_night_price 1
    weekday_dayfree1_price 1
    holiday_dayfree1_price 1
    weekday_nightfree1_price 1
    holiday_nightfree1_price 1
  end
end
