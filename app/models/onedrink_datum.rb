class OnedrinkDatum < ApplicationRecord
  belongs_to :karaoke_shop

  def to_param(date_status)
    day_param(date_status).merge(night_param(date_status))
  end

  private

  def day_param(date_status)
    { day_onedrink: date_status[:day].weekday? ? weekday_day : holiday_day,
      dayfree1_onedrink: date_status[:dayfree1].weekday? ? weekday_dayfree1 : holiday_dayfree1,
      dayfree2_onedrink: date_status[:dayfree2].weekday? ? weekday_dayfree2 : holiday_dayfree2,
    }
  end

  def night_param(date_status)
    { night_onedrink: date_status[:night].weekday? ? weekday_night : holiday_night,
      nightfree1_onedrink: date_status[:nightfree1].weekday? ? weekday_nightfree1 : holiday_nightfree1,
      nightfree2_onedrink: date_status[:nightfree2].weekday? ? weekday_nightfree2 : holiday_nightfree2,
    }
  end

end
