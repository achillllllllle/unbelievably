class AddFavoriteToReservations < ActiveRecord::Migration[7.1]
  def change
    add_column :reservations, :favorite, :string
  end
end
