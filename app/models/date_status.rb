class DateStatus < ApplicationRecord
  belongs_to :karaoke_shop

  def to_param
    {day: day, night: night, dayfree1: day_freetime1, dayfree2: day_freetime2, nightfree1: night_freetime1, nightfree2: night_freetime2}
  end
end
