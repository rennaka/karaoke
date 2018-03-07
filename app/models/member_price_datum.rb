class MemberPriceDatum < ApplicationRecord
  belongs_to :karaoke_shop
  
  def to_param(day_is_weekday ,night_is_weekday)
    day_param(day_is_weekday).merge(night_param(night_is_weekday))
  end

  private

  def day_param(day_is_weekday)
    day_is_weekday ? day_weekday_param : day_holiday_param
  end

  def night_param(night_is_weekday)
    night_is_weekday ? night_weekday_param : night_holiday_param
  end

  def day_weekday_param
    { day_price: weekday_day_price, dayfree1_price: weekday_dayfree1_price, dayfree2_price: weekday_dayfree2_price }.delete_if{|key,value| value == 0 || value.nil?}
  end

  def night_weekday_param
    { night_price: weekday_night_price, nightfree1_price: weekday_nightfree1_price, nightfree2_price: weekday_nightfree2_price }.delete_if{|key,value| value == 0 || value.nil?}
  end

  def day_holiday_param
    { day_price: holiday_day_price, dayfree1_price: holiday_dayfree1_price, dayfree2_price: holiday_dayfree2_price }.delete_if{|key,value| value == 0 || value.nil?}
  end

  def night_holiday_param
    { night_price: holiday_night_price, nightfree1_price: holiday_nightfree1_price, nightfree2_price: holiday_nightfree2_price }.delete_if{|key,value| value == 0 || value.nil?}
  end
end
