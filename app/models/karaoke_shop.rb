class KaraokeShop < ApplicationRecord
  attr_accessor :day_price, :night_price, :dayfree1_price, :nightfree1_price, :open_time, :close_time, :nightstart_time, :nightend_time, :dayfree1_starttime, :dayfree1_endtime, :nightfree1_starttime, :nightfree1_endtime, :day_onedrink, :night_onedrink, :dayfree1_onedrink, :dayfree2_onedrink, :nightfree1_onedrink, :nightfree2_onedrink, :starttime, :endtime, :date
  belongs_to :karaoke_kind
  has_many :date_statuses, dependent: :delete_all
  has_many :shoptime_data, dependent: :delete_all
  has_one :member_price_datum, dependent: :delete
  has_one :freetime_datum, dependent: :delete
  has_one :onedrink_datum, dependent: :delete
  validates :name, presence: true

  def object(date,starttime,endtime)
    KaraokeKind.find(self.karaoke_kind_id).name_of_model.constantize.new(id: self.id, name: self.name, starttime: starttime, endtime: endtime, karaoke_kind_id: self.karaoke_kind_id, date: date, tax_include: self.tax_include)
  end

  def set_parameters
    self.attributes = register_param
    self
  end

  private

  def date_status
    DateStatus.find_by(karaoke_shop_id: self.id, date: date).to_param
  end

  def register_param
    shop_param.merge(price_param).merge(freetime_param).merge(onedrink_param)
  end

  def shop_param
    ShoptimeDatum.find_by(karaoke_shop_id: self.id,date: date).to_param
  end

  def freetime_param
    FreetimeDatum.find_by(karaoke_shop_id: self.id).to_param(date_status)
  end

  def price_param
    MemberPriceDatum.find_by(karaoke_shop_id: self.id).to_param(date_status)
  end

  def onedrink_param
    OnedrinkDatum.find_by(karaoke_shop_id: self.id).to_param(date_status)
  end

end
