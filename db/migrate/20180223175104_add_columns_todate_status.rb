class AddColumnsTodateStatus < ActiveRecord::Migration[5.1]
  def change
    add_column :date_statuses, :day_freetime, :string
    add_column :date_statuses, :night_freetime, :string
  end
end
