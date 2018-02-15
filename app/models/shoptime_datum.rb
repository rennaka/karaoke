class ShoptimeDatum < ApplicationRecord

  def to_param
    {open_time: open_time, close_time: close_time, nightstart_time: nightstart_time}
  end
end
