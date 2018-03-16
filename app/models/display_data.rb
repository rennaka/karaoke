class DisplayData
  attr_reader :shop_name, :type, :charge
  ONEDRINK_PRICE = 350
  def initialize(shop_name,data,playtime_range,onedrink_flag,charge = nil)
    @shop_name = shop_name
    @type = data[:type]
    @freetime_range = data&.[](:range)
    @onedrink_flag = onedrink_flag
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

  def onedrink_price
    @onedrink_flag ? ONEDRINK_PRICE : 0
  end

  def price
    @charge + onedrink_price
  end

end
