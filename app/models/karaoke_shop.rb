class KaraokeShop < ApplicationRecord
  belongs_to :karaoke_kind
  has_many :date_statuses, dependent: :delete_all
  has_many :shoptime_data, dependent: :delete_all
  has_one :member_price_data, dependent: :delete
  has_one :freetime_data, dependent: :delete

  def self.create_all(params)

  end
end
