class FreetimeDatum < ApplicationRecord

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
    { dayfree1_starttime: weekday_dayfree1_starttime,
      dayfree1_endtime: weekday_dayfree1_endtime,
      dayfree1_limittime: weekday_dayfree1_limittime,
      dayfree2_starttime: weekday_dayfree2_starttime,
      dayfree2_endtime: weekday_dayfree2_endtime,
      dayfree2_limittime: weekday_dayfree2_limittime,
    }.delete_if{|key,value| value == 0 || value.nil?}
  end

  def night_weekday_param
    { nightfree1_starttime: weekday_nightfree1_starttime,
      nightfree1_endtime: weekday_nightfree1_endtime,
      nightfree1_limittime: weekday_nightfree1_limittime,
      nightfree2_starttime: weekday_nightfree2_starttime,
      nightfree2_endtime: weekday_nightfree2_endtime,
      nightfree2_limittime: weekday_nightfree2_limittime,
    }.delete_if{|key,value| value == 0 || value.nil?}
  end

  def day_holiday_param
    { dayfree1_starttime: holiday_dayfree1_starttime,
      dayfree1_endtime: holiday_dayfree1_endtime,
      dayfree1_limittime: holiday_dayfree1_limittime,
      dayfree2_starttime: holiday_dayfree2_starttime,
      dayfree2_endtime: holiday_dayfree2_endtime,
      dayfree2_limittime: holiday_dayfree2_limittime,
    }.delete_if{|key,value| value == 0 || value.nil?}
  end

  def night_holiday_param
    { nightfree1_starttime: holiday_nightfree1_starttime,
      nightfree1_endtime: holiday_nightfree1_endtime,
      nightfree1_limittime: holiday_nightfree1_limittime,
      nightfree2_starttime: holiday_nightfree2_starttime,
      nightfree2_endtime: holiday_nightfree2_endtime,
      nightfree2_limittime: holiday_nightfree2_limittime,
    }.delete_if{|key,value| value == 0 || value.nil?}
  end
end
