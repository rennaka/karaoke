class RenameColumnToKaraokeKind < ActiveRecord::Migration[5.1]
  def change
    rename_column :karaoke_kinds, :model_name, :name_of_model
  end
end
