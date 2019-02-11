class ChangeColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :candidates, :photo, :passport_size_photo
  end
end
