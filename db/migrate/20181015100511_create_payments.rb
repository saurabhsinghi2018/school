class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.belongs_to :candidate, foreign_key: true
      t.boolean :status, default: true
      t.timestamps
    end
  end
end
