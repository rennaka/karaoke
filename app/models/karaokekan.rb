class Karaokekan < KaraokeShop

  def normal_charge(start_time,end_time)

  end

  def play_time
    (real_endtime - real_starttime + 86400) % 86400
  end

  private

  def business_hours
    (@open_time..@close_time)
  end

  def real_starttime
    business_hours.include?(@starttime) ? @starttime : @open_time
  end

  def real_endtime
    business_hours.include?(@endtime) ? @endtime : @close_time
  end
end
