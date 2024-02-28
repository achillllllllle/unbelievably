class CreateWonders < ActiveRecord::Migration[7.1]
  def change
    create_table :wonders do |t|
      t.string :title
      t.float :price_per_participant
      t.string :type
      t.string :location

      t.timestamps
    end
  end
end
