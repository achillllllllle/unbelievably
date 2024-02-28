class AddDateAndNbOfPartipantsToReservations < ActiveRecord::Migration[7.1]
  def change
    add_column :reservations, :book_date, :date
    add_column :reservations, :nb_participants, :integer
  end
end
