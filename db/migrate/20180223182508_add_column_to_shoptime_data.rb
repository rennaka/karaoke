class AddColumnToShoptimeData < ActiveRecord::Migration[5.1]
  def change
    add_column :shoptime_data, :nightend_time, :datetime
    change_column :shoptime_data, :nightstart_time, :datetime
  end
end
