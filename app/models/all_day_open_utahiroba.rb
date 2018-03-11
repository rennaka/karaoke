class AllDayOpenUtahiroba < Utahiroba
  NORMAL = '通常'
  DAY_FREETIME = '昼フリータイム'
  NIGHT_FREETIME = '夜フリータイム'

  def display_data_list
    [normal_data,dayfree1_data,nightfree1_data].map{|data| DisplayData.new(self.name,data,playtime_range,charge(data))}.compact
  end

  private

  def normal_data
    {type: NORMAL, onedrink: normal_onedrink_flag}
  end

  def dayfree1_data
    {range: dayfree1time_range, price: dayfree1_price, type: DAY_FREETIME, onedrink: dayfree1_onedrink_flag}
  end

  def nightfree1_data
    {range: nightfree1time_range, price: nightfree1_price, type: NIGHT_FREETIME, onedrink: nightfree1_onedrink_flag}
  end

  def normal_onedrink_flag
    (play_day_time > 0 ? day_onedrink : false) || (play_night_time > 0 ? night_onedrink : false)
  end

  def dayfree1_onedrink_flag
    return false unless playtime_range.cover_range?(dayfree1time_range)
    dayfree1_onedrink || (play_day_time_except(dayfree1time_range) > 0 ? day_onedrink : false) || (play_night_time_except(nightfree1time_range) > 0 ? night_onedrink : false)
  end

  def nightfree1_onedrink_flag
    return false unless playtime_range.cover_range?(nightfree1time_range)
    nightfree1_onedrink || (play_day_time_except(dayfree1time_range) > 0 ? day_onedrink : false) || (play_night_time_except(nightfree1time_range) > 0 ? night_onedrink : false)
  end

  def dayfree1time_range
    TimeRange.new(dayfree1_starttime,dayfree1_endtime)
  end

  def nightfree1time_range
    TimeRange.new(nightfree1_starttime,nightfree1_endtime)
  end

  def playtime_range
    TimeRange.new(starttime,endtime)
  end

  def daytime_ranges
    [TimeRange.new(nightend_time,nightstart_time),TimeRange.new(nightend_time + 1.day,nightstart_time + 1.day)]
  end

  # 料金計算関連

  def charge(data)
    (data[:type] == NORMAL) ? normal_charge : freetime_charge(data[:range],data[:price])
  end

  def normal_charge
    play_day_time.ceil * day_price + play_night_time.ceil * night_price
  end

  def freetime_charge(freetime_range,freetime_price)
    return 0 unless playtime_range.cover_range?(freetime_range)
    freetime_price + play_day_price_except(freetime_range) + play_night_price_except(freetime_range)
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

  def play_day_price_except(freetime_range)
    play_day_time_except(freetime_range) * day_price
  end

  def play_night_price_except(freetime_range)
    play_night_time_except(freetime_range) * night_price
  end

  # フリータイムの時間計算関連

  def play_day_time_except(freetime_range)
    (play_day_time_before(freetime_range) + play_day_time_after(freetime_range)).ceil
  end

  def play_night_time_except(freetime_range)
    (play_night_time_before(freetime_range) + play_night_time_after(freetime_range)).ceil
  end

  def playtime_range_before(freetime_range)
    TimeRange.new(starttime,freetime_range.first)
  end

  def playtime_range_after(freetime_range)
    TimeRange.new(freetime_range.last,endtime)
  end

  def playtime_before(freetime_range)
    (playtime_range_before(freetime_range).last - playtime_range_before(freetime_range).first).to_non_negative / 1800
  end

  def playtime_after(freetime_range)
    (playtime_range_after(freetime_range).last - playtime_range_after(freetime_range).first).to_non_negative / 1800
  end

  def play_day_time_before(freetime_range)
    daytime_ranges.map{|daytime_range| playtime_range_before(freetime_range).has_time_in(daytime_range)}.inject(:+)
  end

  def play_day_time_after(freetime_range)
    daytime_ranges.map{|daytime_range| playtime_range_after(freetime_range).has_time_in(daytime_range)}.inject(:+)
  end

  def play_night_time_before(freetime_range)
    playtime_before(freetime_range) - play_day_time_before(freetime_range)
  end

  def play_night_time_after(freetime_range)
    playtime_after(freetime_range) - play_day_time_after(freetime_range)
  end

end
