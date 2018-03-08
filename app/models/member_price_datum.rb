class MemberPriceDatum < ApplicationRecord
  belongs_to :karaoke_shop

  def to_param(date_status)
    days_param(date_status).merge(nights_param(date_status)).delete_if{|key,value| value == 0 || value.nil?}
  end

  private

  def days_param(date_status)
    day_param(date_status).merge(dayfree1_param(date_status)).merge(dayfree2_param(date_status))
  end

  def nights_param(date_status)
    night_param(date_status).merge(nightfree1_param(date_status)).merge(nightfree2_param(date_status))
  end

  def day_param(date_status)
    date_status[:day].weekday? ? day_weekday_param : day_holiday_param
  end

  def night_param(date_status)
    date_status[:night].weekday? ? night_weekday_param : night_holiday_param
  end

  def dayfree1_param(date_status)
    date_status[:dayfree1].weekday? ? dayfree1_weekday_param : dayfree1_holiday_param
  end

  def dayfree2_param(date_status)
    date_status[:dayfree2].weekday? ? dayfree2_weekday_param : dayfree2_holiday_param
  end

  def nightfree1_param(date_status)
    date_status[:nightfree1].weekday? ? nightfree1_weekday_param : nightfree1_holiday_param
  end

  def nightfree2_param(date_status)
    date_status[:nightfree2].weekday? ? nightfree2_weekday_param : nightfree2_holiday_param
  end

  def day_weekday_param
    { day_price: weekday_day_price }
  end

  def night_weekday_param
    { night_price: weekday_night_price }
  end

  def day_holiday_param
    { day_price: holiday_day_price }
  end

  def night_holiday_param
    { night_price: holiday_night_price }
  end

  def dayfree1_weekday_param
    { dayfree1_price: weekday_dayfree1_price }
  end

  def nightfree1_weekday_param
    { nightfree1_price: weekday_nightfree1_price }
  end

  def dayfree1_holiday_param
    { dayfree1_price: holiday_dayfree1_price }
  end

  def nightfree1_holiday_param
    { nightfree1_price: holiday_nightfree1_price }
  end

  def dayfree2_weekday_param
    { dayfree2_price: weekday_dayfree2_price }
  end

  def nightfree2_weekday_param
    { nightfree2_price: weekday_nightfree2_price }
  end

  def dayfree2_holiday_param
    { dayfree2_price: holiday_dayfree2_price }
  end

  def nightfree2_holiday_param
    { nightfree2_price: holiday_nightfree2_price }
  end
end
