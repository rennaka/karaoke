class CreateShoptimeData < ActiveRecord::Migration[5.1]
  def change
    create_table :shoptime_data do |t|
      t.string :date
      t.time :open_time
      t.time :close_time
      t.string :nightstart_time
      t.integer :karaoke_shop_id

      t.timestamps
    end
  end
end
