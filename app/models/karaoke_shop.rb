class KaraokeShop < ApplicationRecord
  attr_accessor :day_price, :night_price, :dayfree1_price, :nightfree1_price, :open_time, :close_time, :nightstart_time, :dayfree1_starttime, :dayfree1_endtime, :nightfree1_starttime, :nightfree1_endtime, :starttime, :endtime
  belongs_to :karaoke_kind
  has_many :date_statuses, dependent: :delete_all
  has_many :shoptime_data, dependent: :delete_all
  has_one :member_price_datum, dependent: :delete
  has_one :freetime_datum, dependent: :delete
  has_one :onedrink_datum, dependent: :delete
  validates :name, presence: true

  def self.create_all(params)

  end

  def object(date,starttime,endtime)
    KaraokeKind.find(self.karaoke_kind_id).name_of_model.constantize.new(id: self.id, name: self.name, starttime: starttime, endtime: endtime, karaoke_kind_id: self.karaoke_kind_id).set_parameters(date)
  end

  def set_parameters(date)
    self.attributes = register_param(date)
    self
  end

  private

  def day_is_weekday?(date)
    DateStatus.find_by(karaoke_shop_id: self.id, date: date).day == "WEEKDAY"
  end

  def night_is_weekday?(date)
    DateStatus.find_by(karaoke_shop_id: self.id, date: date).night == "WEEKDAY"
  end

  def register_param(date)
    shop_param.merge(price_param(date)).merge(freetime_param(date))
  end

  def shop_param
    ShoptimeDatum.find_by(karaoke_shop_id: self.id).to_param
  end

  def freetime_param(date)
    FreetimeDatum.find_by(karaoke_shop_id: self.id).to_param(day_is_weekday?(date), night_is_weekday?(date))
  end

  def price_param(date)
    MemberPriceDatum.find_by(karaoke_shop_id: self.id).to_param(day_is_weekday?(date), night_is_weekday?(date))
  end

end
