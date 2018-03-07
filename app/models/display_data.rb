class DisplayData
  attr_reader :shop_name, :type, :charge
  
  def initialize(shop_name,data,playtime_range,charge)
    @shop_name = shop_name
    @type = data[:type]
    @freetime_range = data&.[](:range)
    @starttime = playtime_range.first
    @endtime = playtime_range.last
    @charge = charge
  end

  def starttime
    [@starttime,@freetime_range&.first].compact.min
  end

  def endtime
    [@endtime,@freetime_range&.last].compact.max
  end

end
