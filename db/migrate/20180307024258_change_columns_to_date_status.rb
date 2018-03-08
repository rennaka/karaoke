class ChangeColumnsToDateStatus < ActiveRecord::Migration[5.1]
  def change
    rename_column :date_statuses, :day_freetime, :day_freetime1
    rename_column :date_statuses, :night_freetime, :night_freetime1
    add_column :date_statuses, :day_freetime2, :string
    add_column :date_statuses, :night_freetime2, :string
  end
end
