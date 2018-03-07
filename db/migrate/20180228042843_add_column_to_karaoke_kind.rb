class AddColumnToKaraokeKind < ActiveRecord::Migration[5.1]
  def change
    add_column :karaoke_kinds, :name_of_price_model, :string
  end
end
