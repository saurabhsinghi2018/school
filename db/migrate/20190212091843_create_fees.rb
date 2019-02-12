class CreateFees < ActiveRecord::Migration[5.0]
  def change
    create_table :fees do |t|
      t.string :klass
      t.string :fee

      t.timestamps
    end
  end
end
