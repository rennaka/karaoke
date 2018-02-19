class Karaokekan < KaraokeShop

  def normal_charge(start_time,end_time)

  end

  def play_time
    (real_endtime - real_starttime + 86400) % 86400
  end

  private

  def real_starttime
    (@starttime - @open_time) > 0 ? @starttime : @open_time
  end

  def real_endtime
    (@endtime - @close_time) > 0 ? @endtime : @close_time
  end
end
