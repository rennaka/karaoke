class OnlyTime

  YEAR = EasySettings.year
  MONTH = EasySettings.month
  DAY = EasySettings.day
  BEFORE_TIME = Time.zone.local(YEAR - 1,MONTH,DAY,0,0)
  AFTER_TIME = Time.zone.local(YEAR + 1,MONTH,DAY,0,0)


  def self.set(time_params)
    Time.zone.local(YEAR,MONTH,DAY,time_params.values[3],time_params.values[4])
  end

  def self.set_times(former_time_params,latter_time_params)
    return {former: nil, latter: nil} if set(former_time_params) == set(latter_time_params)
    tmp_latter_time = set(latter_time_params)
    tmp_latter_time >= set(former_time_params) ? {former: set(former_time_params), latter: set(latter_time_params)} : {former: set(former_time_params), latter: set(latter_time_params) + 1.day}
  end

end
