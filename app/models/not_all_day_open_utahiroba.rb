class NotAllDayOpenUtahiroba < Utahiroba
  after_initialize :set_parameters, if: :new_record?
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
    TimeRange.new(real_starttime,real_endtime)
  end

  def business_hours
    TimeRange.new(open_time,close_time)
  end

  def daytime_range
    TimeRange.new(OnlyTime::BEFORE_TIME,nightstart_time)
  end

  def nighttime_range
    TimeRange.new(nightstart_time,OnlyTime::AFTER_TIME)
  end

  def real_starttime
    tmp_starttime = starttime
    tmp_starttime += 1.day unless business_hours.cover_range?(starttime..endtime)
    open_time > tmp_starttime ? open_time : tmp_starttime
  end

  def real_endtime
    tmp_endtime = endtime
    tmp_endtime += 1.day unless business_hours.cover_range?(starttime..endtime)
    tmp_endtime > close_time ? close_time : tmp_endtime
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

  def play_day_time
    ([nightstart_time,real_endtime].compact.min - real_starttime).to_non_negative / 1800
  end

  def play_night_time
    (real_endtime - [real_starttime,nightstart_time].max).to_non_negative / 1800
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
    TimeRange.new(real_starttime,freetime_range.first)
  end

  def playtime_range_after(freetime_range)
    TimeRange.new(freetime_range.last,real_endtime)
  end

  def play_day_time_before(freetime_range)
    playtime_range_before(freetime_range).has_time_in(daytime_range)
  end

  def play_day_time_after(freetime_range)
    playtime_range_after(freetime_range).has_time_in(daytime_range)
  end

  def play_night_time_before(freetime_range)
    playtime_range_before(freetime_range).has_time_in(nighttime_range)
  end

  def play_night_time_after(freetime_range)
    playtime_range_after(freetime_range).has_time_in(nighttime_range)
  end

end
