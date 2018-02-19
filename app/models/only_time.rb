class OnlyTime

  YEAR = EasySettings.year
  MONTH = EasySettings.month
  DAY = EasySettings.day

  def self.set(hour,minute)
    Time.zone.local(YEAR,MONTH,DAY,hour,minute)
  end

end
