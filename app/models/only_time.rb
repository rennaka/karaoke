class OnlyTime

  YEAR = EasySettings.year
  MONTH = EasySettings.month
  DAY = EasySettings.day
  DEFAULT_TIME = Time.zone.local(YEAR,MONTH,DAY,0,0)
  DEFAULT_OPEN_TIME = Time.zone.local(YEAR,MONTH,DAY,0,0)
  DEFAULT_CLOSE_TIME = Time.zone.local(YEAR,MONTH,DAY + 2,0,0)

  def self.set(time_params)
    Time.zone.local(YEAR,MONTH,DAY,time_params.values[3],time_params.values[4])
  end

  def self.set_times(former_time_params,latter_time_params)
    return {former: nil, latter: nil} if set(former_time_params) == set(latter_time_params)
    tmp_latter_time = set(latter_time_params)
    tmp_latter_time >= set(former_time_params) ? {former: set(former_time_params), latter: set(latter_time_params)} : {former: set(former_time_params), latter: set(latter_time_params) + 1.day}
  end

  def self.open_time(open_time_params)
    set(open_time_params) == DEFAULT_TIME ? DEFAULT_OPEN_TIME : set(open_time_params)
  end

  def self.close_time(close_time_params)
    set(close_time_params) == DEFAULT_TIME ? DEFAULT_CLOSE_TIME : set(close_time_params)
  end

  def self.shop_time(open_time_params,close_time_params)
    tmp_close_time = close_time(close_time_params)
    open_time(open_time_params) <= tmp_close_time ? {open_time: open_time(open_time_params), close_time: tmp_close_time} : {open_time: open_time(open_time_params), close_time: tmp_close_time + 1.day}
  end

  def self.freetime(starttime_params,endtime_params)
    return {starttime: nil, endtime: nil} if set(starttime_params) == set(endtime_params)
    tmp_endtime = set(endtime_params)
    tmp_endtime >= set(starttime_params) ? {starttime: set(starttime_params), endtime: set(endtime_params)} : {starttime: set(starttime_params), endtime: set(endtime_params) + 1.day}
  end

end
