class KaraokekanCalculateCharge < Karaokekan

  def initialize(freetime_range = nil,freetime_price = nil)
    @freetime_range = freetime_range
    @freetime_price = freetime_price
  end

  def normal
    play_day_time.ceil * day_price + play_night_time.ceil * night_price
  end

  def freetime
    return 0 unless playtime_range.cover_freetime?(@freetime_range)
    @freetime_price + except_freetime_play_day_price + except_freetime_play_night_price
  end

  private

  def except_freetime_play_day_price
    KaraokekanCalculateFreetime.new(@freetime_range).except_freetime_play_day_time * day_price
  end

  def except_freetime_play_night_price
    KaraokekanCalculateFreetime.new(@freetime_range).except_freetime_play_night_time * night_price
  end

end
