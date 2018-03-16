class AllDayOpenUtahiroba < Utahiroba
  NORMAL = '通常'
  DAY_FREETIME = '昼フリータイム'
  NIGHT_FREETIME = '夜フリータイム'

  def display_data_list
    [normal_data,dayfree1_data,nightfree1_data].map do |data|
      calc = CalcAllDayOpenUtahiroba.new(id: self.id, name: self.name, starttime: starttime, endtime: endtime, karaoke_kind_id: self.karaoke_kind_id, date: date, freetime_range: data[:range])
      DisplayData.new(self.name,data,playtime_today_range,onedrink_flag(calc,data),charge(calc,data))
    end.compact
  end

  private

  def normal_data
    {type: NORMAL, range: TimeRange.new(nil,nil)}
  end

  def dayfree1_data
    {range: dayfree1time_range, price: dayfree1_price, type: DAY_FREETIME, onedrink: dayfree1_onedrink}
  end

  def nightfree1_data
    {range: nightfree1time_range, price: nightfree1_price, type: NIGHT_FREETIME, onedrink: nightfree1_onedrink}
  end

  def dayfree1time_range
    TimeRange.new(dayfree1_starttime,dayfree1_endtime)
  end

  def nightfree1time_range
    TimeRange.new(nightfree1_starttime,nightfree1_endtime)
  end

  def playtime_today_range
    TimeRange.new(starttime,endtime)
  end

  def playtime_tomorrow_range
    TimeRange.new(starttime + 1.day,endtime + 1.day)
  end

  def daytime_ranges
    [TimeRange.new(nightend_time,nightstart_time),TimeRange.new(nightend_time + 1.day,nightstart_time + 1.day)]
  end

  def charge(calc,data)
    (data[:type] == NORMAL) ? calc.normal_charge : calc.freetime_charge(data[:price])
  end

  def onedrink_flag(calc,data)
    (data[:type] == NORMAL) ? calc.normal_onedrink_flag : calc.freetime_onedrink_flag(data[:onedrink])
  end

end
