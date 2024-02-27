class AddDefaultValueToAccepted < ActiveRecord::Migration[7.1]
  def change
    change_column_default :reservations, :accepted, false
  end
end
