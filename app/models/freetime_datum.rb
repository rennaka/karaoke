class FreetimeDatum < ApplicationRecord
  belongs_to :karaoke_shop

  def to_param(date_status)
    day_param(date_status).merge(night_param(date_status))
  end

  private

  def day_param(date_status)
    dayfree1_param(date_status).merge(dayfree2_param(date_status))
  end

  def night_param(date_status)
    nightfree1_param(date_status).merge(nightfree2_param(date_status))
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

  def dayfree1_weekday_param
    { dayfree1_starttime: weekday_dayfree1_starttime,
      dayfree1_endtime: weekday_dayfree1_endtime,
      dayfree1_limittime: weekday_dayfree1_limittime,
    }.delete_if{|key,value| value == 0 || value.nil?}
  end

  def dayfree2_weekday_param
    { dayfree2_starttime: weekday_dayfree2_starttime,
      dayfree2_endtime: weekday_dayfree2_endtime,
      dayfree2_limittime: weekday_dayfree2_limittime,
    }.delete_if{|key,value| value == 0 || value.nil?}
  end

  def nightfree1_weekday_param
    { nightfree1_starttime: weekday_nightfree1_starttime,
      nightfree1_endtime: weekday_nightfree1_endtime,
      nightfree1_limittime: weekday_nightfree1_limittime,
    }.delete_if{|key,value| value == 0 || value.nil?}
  end

  def nightfree2_weekday_param
    { nightfree2_starttime: weekday_nightfree2_starttime,
      nightfree2_endtime: weekday_nightfree2_endtime,
      nightfree2_limittime: weekday_nightfree2_limittime,
    }.delete_if{|key,value| value == 0 || value.nil?}
  end

  def dayfree1_holiday_param
    { dayfree1_starttime: holiday_dayfree1_starttime,
      dayfree1_endtime: holiday_dayfree1_endtime,
      dayfree1_limittime: holiday_dayfree1_limittime,
    }.delete_if{|key,value| value == 0 || value.nil?}
  end

  def dayfree2_holiday_param
    { dayfree2_starttime: holiday_dayfree2_starttime,
      dayfree2_endtime: holiday_dayfree2_endtime,
      dayfree2_limittime: holiday_dayfree2_limittime,
    }.delete_if{|key,value| value == 0 || value.nil?}
  end

  def nightfree1_holiday_param
    { nightfree1_starttime: holiday_nightfree1_starttime,
      nightfree1_endtime: holiday_nightfree1_endtime,
      nightfree1_limittime: holiday_nightfree1_limittime,
    }.delete_if{|key,value| value == 0 || value.nil?}
  end

  def nightfree2_holiday_param
    { nightfree2_starttime: holiday_nightfree2_starttime,
      nightfree2_endtime: holiday_nightfree2_endtime,
      nightfree2_limittime: holiday_nightfree2_limittime,
    }.delete_if{|key,value| value == 0 || value.nil?}
  end

end
