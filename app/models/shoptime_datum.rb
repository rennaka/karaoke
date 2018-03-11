class ShoptimeDatum < ApplicationRecord
  belongs_to :karaoke_shop

  def to_param
    {open_time: open_time, close_time: close_time, nightstart_time: nightstart_time, nightend_time: nightend_time}.delete_if{|key,value| value == 0 || value.nil?}
  end

end
