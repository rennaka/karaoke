class KaraokeShop < ApplicationRecord
  attr_accessor :day_price, :night_price, :dayfree1_price, :nightfree1_price, :open_time, :close_time, :nightstart_time, :nightend_time,
                :dayfree1_starttime, :dayfree1_endtime, :nightfree1_starttime, :nightfree1_endtime, :day_onedrink, :night_onedrink, :dayfree1_onedrink, :dayfree2_onedrink, :nightfree1_onedrink, :nightfree2_onedrink, :starttime, :endtime, :date, :shop_data
  belongs_to :karaoke_kind
  belongs_to :area
  has_many :date_statuses, dependent: :delete_all
  has_many :shoptime_data, dependent: :delete_all
  has_one :member_price_datum, dependent: :delete
  has_one :freetime_datum, dependent: :delete
  has_one :onedrink_datum, dependent: :delete
  validates :name, presence: true

  def object(date,starttime,endtime)
    KaraokeKind.find(self.karaoke_kind_id).name_of_model.constantize.new(id: self.id, name: self.name, starttime: starttime, endtime: endtime, karaoke_kind_id: self.karaoke_kind_id, date: date, tax_include: self.tax_include, homepage_link: self.homepage_link, shop_data: register_param(date)).set_parameters
  end

  def set_parameters
    self.attributes = shop_data
    self
  end


  private

  def date_status(date)
    DateStatus.find_by(karaoke_shop_id: self.id, date: date).to_param
  end

  def register_param(date)
    shop_param(date).merge(price_param(date)).merge(freetime_param(date)).merge(onedrink_param(date))
  end

  def shop_param(date)
    ShoptimeDatum.find_by(karaoke_shop_id: self.id,date: date).to_param
  end

  def freetime_param(date)
    FreetimeDatum.find_by(karaoke_shop_id: self.id).to_param(date_status(date))
  end

  def price_param(date)
    MemberPriceDatum.find_by(karaoke_shop_id: self.id).to_param(date_status(date))
  end

  def onedrink_param(date)
    OnedrinkDatum.find_by(karaoke_shop_id: self.id).to_param(date_status(date))
  end

end
