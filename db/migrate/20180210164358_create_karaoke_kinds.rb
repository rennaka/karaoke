class CreateKaraokeKinds < ActiveRecord::Migration[5.1]
  def change
    create_table :karaoke_kinds do |t|
      t.string :name
      t.string :model_name

      t.timestamps
    end
  end
end
