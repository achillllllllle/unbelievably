class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.date :start_date
      t.date :end_date
      t.float :price
      t.references :user, null: false, foreign_key: true
      t.references :wonder, null: false, foreign_key: true
      t.boolean :accepted

      t.timestamps
    end
  end
end
