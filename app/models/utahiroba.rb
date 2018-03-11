class Utahiroba < KaraokeShop
  attr_accessor :nightend_time
  after_initialize :set_parameters, if: :new_record?
  NORMAL = '通常'
  DAY_FREETIME = '昼フリータイム'
  NIGHT_FREETIME = '夜フリータイム'

  def display_data_list
    all_day_open? ? AllDayOpenUtahiroba.new(id: self.id, name: self.name, starttime: starttime, endtime: endtime, karaoke_kind_id: self.karaoke_kind_id, date: date).display_data_list : NotAllDayOpenUtahiroba.new(id: self.id, name: self.name, starttime: starttime, endtime: endtime, karaoke_kind_id: self.karaoke_kind_id, date: date).display_data_list
  end

  def all_day_open?
    open_time == close_time
  end

end
