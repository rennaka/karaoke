class CreateDateStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :date_statuses do |t|
      t.string :date
      t.string :day
      t.string :night
      t.integer :karaoke_shop_id

      t.timestamps
    end
  end
end
