class Tetsujin < KaraokeShop
  attr_accessor :dayfree2_price, :nightfree2_price, :dayfree2_starttime, :dayfree2_endtime, :nightfree2_starttime, :nightfree2_endtime, :dayfree2_onedrink, :nightfree2_onedrink, :dayfree1_start_limittime, :dayfree2_start_limittime, :nightfree1_start_limittime, :nightfree2_start_limittime
  NORMAL = '通常'
  DAY_FREETIME = '昼フリータイム'
  NIGHT_FREETIME = '夜フリータイム'

  def display_data_list
    [normal_data,dayfree1_data,dayfree2_data,nightfree1_data,nightfree2_data].map do |data|
      calc = CalcTetsujin.new(starttime: starttime, endtime: endtime, freetime_range: data[:range], limittime_range: data[:limit_range], shop_data: self.shop_data).set_parameters.set_playtime_range
      DisplayData.new(name,data,playtime_today_range,onedrink(calc,data),charge(calc,data),tax_include,karaoke_kind_id,homepage_link)
    end.compact
  end

  private

  def normal_data
    {type: NORMAL, range: TimeRange.new(nil,nil)}
  end

  def dayfree1_data
    {range: dayfree1time_range, price: dayfree1_price, type: DAY_FREETIME, onedrink: dayfree1_onedrink}
  end

  def dayfree2_data
    {range: dayfree2time_range, limit_range: dayfree2_limit_range, price: dayfree2_price, type: DAY_FREETIME, onedrink: dayfree2_onedrink}
  end

  def nightfree1_data
    {range: nightfree1time_range, price: nightfree1_price, type: NIGHT_FREETIME, onedrink: nightfree1_onedrink}
  end

  def nightfree2_data
    {range: nightfree2time_range, price: nightfree2_price, type: NIGHT_FREETIME, onedrink: nightfree2_onedrink}
  end

  def dayfree1time_range
    TimeRange.new(dayfree1_starttime,dayfree1_endtime)
  end

  def dayfree2time_range
    TimeRange.new(dayfree2_starttime,dayfree2_endtime)
  end

  def nightfree1time_range
    TimeRange.new(nightfree1_starttime,nightfree1_endtime)
  end

  def nightfree2time_range
    TimeRange.new(nightfree2_starttime,nightfree2_endtime)
  end

  def dayfree2_limit_range
    dayfree2_start_limittime ? TimeRange.new(dayfree2_starttime,dayfree2_start_limittime) : nil
  end

  def playtime_today_range
    TimeRange.new(real_starttime,real_endtime)
  end

  def playtime_tomorrow_range
    TimeRange.new(real_starttime + 1.day,real_endtime + 1.day)
  end

  def playtime_yesterday_range
    TimeRange.new(real_starttime - 1.day,real_endtime - 1.day)
  end

  def business_hours
    TimeRange.new(open_time,close_time)
  end

  def daytime_ranges
    nightend_time ? [TimeRange.new(nightend_time,nightstart_time),TimeRange.new(nightend_time + 1.day,nightstart_time + 1.day)] : [TimeRange.new(OnlyTime::DEFAULT_OPEN_TIME,nightstart_time)]
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

  def charge(calc,data)
    (data[:type] == NORMAL) ? calc.normal_charge : calc.freetime_charge(data[:price])
  end

  def onedrink(calc,data)
    (data[:type] == NORMAL) ? calc.normal_onedrink_flag : calc.freetime_onedrink_flag(data[:onedrink])
  end

end
