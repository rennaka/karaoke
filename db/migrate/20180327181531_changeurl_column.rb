class ChangeurlColumn < ActiveRecord::Migration[5.1]
  def change
    change_column :karaoke_shops, :url, :text
  end
end
