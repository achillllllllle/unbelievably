class RemoveStatusFromReservations < ActiveRecord::Migration[7.1]
  def change
    remove_column :reservations, :status, :integer
  end
end
