class OnedrinkDatum < ApplicationRecord
  belongs_to :karaoke_shop

  def to_param(date_status)
    day_param(date_status).merge(night_param(date_status)).delete_if{|key,value| value == 0 || value.nil?}
  end

  private

  def day_param(date_status)
    { day_onedrink: date_status[:day].weekday?,
      dayfree1_onedrink: date_status[:dayfree1].weekday?,
      dayfree2_onedrink: date_status[:dayfree2].weekday?,
    }
  end

  def night_param(date_status)
    { night_onedrink: date_status[:night].weekday?,
      nightfree1_onedrink: date_status[:nightfree1].weekday?,
      nightfree2_onedrink: date_status[:nightfree2].weekday?,
    }
  end

end
