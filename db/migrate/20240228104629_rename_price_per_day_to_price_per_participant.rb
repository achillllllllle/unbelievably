class RenamePricePerDayToPricePerParticipant < ActiveRecord::Migration[7.1]
  def change
    rename_column :wonders, :price_per_day, :price_per_participant
  end
end
