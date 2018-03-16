class CalcKaraokekan < Karaokekan
  attr_accessor :freetime_range

  def normal_onedrink_flag
    (play_day_time > 0 ? day_onedrink : false) || (play_night_time > 0 ? night_onedrink : false)
  end

  def freetime_onedrink_flag(freetime_onedrink)
    return false unless playtime_range.cover_range?(freetime_range)
    freetime_onedrink || (play_day_time_except_freetime > 0 ? day_onedrink : false) || (play_night_time_except_freetime > 0 ? night_onedrink : false)
  end

  def normal_charge
    play_day_time.ceil * day_price + play_night_time.ceil * night_price
  end

  def freetime_charge(freetime_price)
    return 0 unless playtime_range.cover_range?(freetime_range)
    freetime_price + play_day_price_except_freetime + play_night_price_except_freetime
  end

  def play_day_time
    ([nightstart_time,real_endtime].compact.min - real_starttime).to_non_negative / 1800
  end

  def play_night_time
    (real_endtime - [real_starttime,nightstart_time].max).to_non_negative / 1800
  end

  def play_day_price_except_freetime
    play_day_time_except_freetime * day_price
  end

  def play_night_price_except_freetime
    play_night_time_except_freetime * night_price
  end

  # フリータイムの時間計算関連

  def play_day_time_except_freetime
    (play_day_time_before_freetime + play_day_time_after_freetime).ceil
  end

  def play_night_time_except_freetime
    (play_night_time_before_freetime + play_night_time_after_freetime).ceil
  end

  def playtime_range_before_freetime
    TimeRange.new(real_starttime,freetime_range.first)
  end

  def playtime_range_after_freetime
    TimeRange.new(freetime_range.last,real_endtime)
  end

  def play_day_time_before_freetime
    playtime_range_before_freetime.has_time_in(daytime_range)
  end

  def play_day_time_after_freetime
    playtime_range_after_freetime.has_time_in(daytime_range)
  end

  def play_night_time_before_freetime
    playtime_range_before_freetime.has_time_in(nighttime_range)
  end

  def play_night_time_after_freetime
    playtime_range_after_freetime.has_time_in(nighttime_range)
  end

end
