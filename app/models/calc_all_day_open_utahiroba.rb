class CalcAllDayOpenUtahiroba < AllDayOpenUtahiroba
  attr_accessor :freetime_range

  def playtime_range
    return playtime_tomorrow_range if playtime_tomorrow_range.cover_range?(freetime_range)
    playtime_today_range
  end

  # ワンドリンク関連

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

  def play_time
    (playtime_range.last - playtime_range.first) / 1800
  end

  def play_day_time
    daytime_ranges.map{|daytime_range| playtime_range.has_time_in(daytime_range)}.inject(:+)
  end

  def play_night_time
    play_time - play_day_time
  end

  def freetime_charge(freetime_price)
    return 0 unless playtime_range.cover_range?(freetime_range)
    freetime_price + play_day_price_except_freetime + play_night_price_except_freetime
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
    TimeRange.new(playtime_range.first,freetime_range.first)
  end

  def playtime_range_after_freetime
    TimeRange.new(freetime_range.last,playtime_range.last)
  end

  def playtime_before_freetime
    (playtime_range_before_freetime.last - playtime_range_before_freetime.first).to_non_negative / 1800
  end

  def playtime_after_freetime
    (playtime_range_after_freetime.last - playtime_range_after_freetime.first).to_non_negative / 1800
  end

  def play_day_time_before_freetime
    daytime_ranges.map{|daytime_range| playtime_range_before_freetime.has_time_in(daytime_range)}.inject(:+)
  end

  def play_day_time_after_freetime
    daytime_ranges.map{|daytime_range| playtime_range_after_freetime.has_time_in(daytime_range)}.inject(:+)
  end

  def play_night_time_before_freetime
    playtime_before_freetime - play_day_time_before_freetime
  end

  def play_night_time_after_freetime
    playtime_after_freetime - play_day_time_after_freetime
  end

end
