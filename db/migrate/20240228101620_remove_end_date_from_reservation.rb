class RemoveEndDateFromReservation < ActiveRecord::Migration[7.1]
  def change
    remove_columns :reservations, :end_date, :start_date
  end
end
