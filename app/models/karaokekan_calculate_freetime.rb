class KaraokekanCalculateFreetime < Karaokekan

  def initialize(freetime_range)
    @freetime_range = freetime_range
  end

  def except_freetime_play_day_time
    (before_freetime_play_day_time + after_freetime_play_day_time).ceil
  end

  def except_freetime_play_night_time
    (before_freetime_play_night_time + after_freetime_play_night_time).ceil
  end

  private

  def before_freetime_play_day_time
    ([@freetime_range.first,nightstart_time].min - real_starttime).to_non_negative / 1800
  end

  def after_freetime_play_day_time
    ([nightstart_time,real_endtime].min - @freetime_range.last).to_non_negative / 1800
  end

  def before_freetime_play_night_time
    (@freetime_range.first - [night_starttime,real_starttime].max).to_non_negative / 1800
  end

  def after_freetime_play_night_time
    (real_endtime - [nightstart_time,@freetime_range.last].max).to_non_negative / 1800
  end

end
