class DisplayData
  attr_reader :shop_name, :type, :charge, :onedrink_price, :karaoke_kind_id, :homepage_link
  ONEDRINK_PRICE = 350
  TAX_RATE = 0.08
  def initialize(shop_name,data,playtime_range,onedrink_flag,charge,tax_include,karaoke_kind_id,homepage_link)
    @shop_name = shop_name
    @type = data[:type]
    @freetime_range = data&.[](:range)
    @onedrink_price = onedrink_flag ? ONEDRINK_PRICE : 0
    @starttime = playtime_range.first
    @endtime = playtime_range.last
    @charge = charge
    @tax_include = tax_include
    @karaoke_kind_id = karaoke_kind_id
    @homepage_link = homepage_link
  end

  def starttime
    [@starttime,@freetime_range&.first].compact.min
  end

  def endtime
    [@endtime,@freetime_range&.last].compact.max
  end

  def tax
    @tax_include ? 1 : 1 + TAX_RATE
  end

  def price
    ((charge + onedrink_price) * tax).round
  end

end
