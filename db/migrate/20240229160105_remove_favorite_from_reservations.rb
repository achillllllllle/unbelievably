class RemoveFavoriteFromReservations < ActiveRecord::Migration[7.1]
  def change
    remove_column :reservations, :favorite, :string
  end
end
