class Tetsujin < KaraokeShop
  attr_accessor :nightend_time, :dayfree2_price, :nightfree2_price, :dayfree2_starttime, :dayfree2_endtime, :nightfree2_starttime, :nightfree2_endtime, :dayfree2_onedrink, :nightfree2_onedrink
  after_initialize :set_parameters, if: :new_record?
  NORMAL = '通常'
  DAY_FREETIME = '昼フリータイム'
  NIGHT_FREETIME = '夜フリータイム'

  def display_data_list
    all_day_open? ? AllDayOpenTetsujin.new(id: self.id, name: self.name, starttime: starttime, endtime: endtime, karaoke_kind_id: self.karaoke_kind_id, date: date).display_data_list : NotAllDayOpenTetsujin.new(id: self.id, name: self.name, starttime: starttime, endtime: endtime, karaoke_kind_id: self.karaoke_kind_id, date: date).display_data_list
  end

  def all_day_open?
    open_time == close_time
  end

end
